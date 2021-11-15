//
//  SocketManager.swift
//  lgtv-controller
//
//  Created by Matheus Gois on 22/10/21.
//

import WebSocket
import WebSocketProtocol
import SwiftUI
import Combine

// Class

class SocketHelper: ObservableObject {

    // Internal

    internal var socket: WebSocket?

    // Private

    private var sub: AnyCancellable?
    private var buttonSub: AnyCancellable?
    private let url: URL
    private var buttonSocket: WebSocket?
    private var buttonType: CommunicatorButton?
    private var clientSocket: URLSessionWebSocketTask?

    // Published

    @Published var isConnected = false
    @Published var errorIsPresented = false
    @Published var error: String = .empty

    // Computed

    var state: DSImage { isConnected ? .powerOn : .powerOff }

    // Lifecycle

    init(url: URL) {
        self.url = url
        setupSocket()
    }

    // Methods

    func setupSocket() {
        socket = WebSocket(url: url)
        sub = socket?.sink(
            receiveCompletion: {
                DispatchQueue.main.async { self.isConnected = false }
                print("Socket closed: \(String(describing: $0))")
            },
            receiveValue: { result in
                switch result {
                case .success(.open):
                    print("Socket is open...")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.register()
                    }
                case .success(let data):
                    print("Received \(data)")
                    self.receiveData(data: data)
                case .failure(let error):
                    DispatchQueue.main.async { self.isConnected = false }
                    self.error(error.localizedDescription)
                    self.socket?.close()
                }
            }
        )
    }

    func connect() {
        clientSocket = nil
        setupSocket()
        socket?.connect()
    }

    func register() {
        guard isConnected else { return }

        socket?.send(Paring.key)
    }

    func receiveData(data: WebSocketMessage) {
        if let model = data.description.model(type: Communicator.self) {
            switch model.type {
            case .error:
                error(model.error)
            case .registered:
                registered(model)
            case .response:
                receiveResponse(model)
            default:
                break
            }
        }
    }

    func receiveResponse(_ model: Communicator) {
        if let url = model.payload?.socketPath {
            socketInputButton(url)
            return
        }
    }

    func socketInputButton(_ url: String) {
        guard let type = buttonType else { return }
        buttonSocket = WebSocket(url: .init(string: url)!)
        buttonSub = buttonSocket?.sink(
            receiveCompletion: {
                print("socketCommand closed: \(String(describing: $0))")
            },
            receiveValue: { result in
                switch result {
                case .success(.open(let client)):
                    print("socketCommand is open...")
                    self.clientSocket = client
                    client.send(type.message) { _ in }
                    self.showToast(message: "success.connection".localized)
                    DispatchQueue.main.async { self.isConnected = true }
                case .success(let data):
                    print("Received \(data)")
                case .failure(let error):
                    self.error(error.localizedDescription)
                    self.socket?.close()
                }
            }
        )

        buttonSocket?.connect()
    }

    func error(_ error: String? = nil) {
        DispatchQueue.main.async {
            self.errorIsPresented = true
            self.error = error ?? "error.connection".localized
        }
    }

    func registered(_ model: Communicator) {
        if let clientKey = model.payload?.clientKey {
            DataStorage.clientKey = clientKey
            send(.getInputSocket)
        } else {
            error()
        }
    }

    func showToast(message: String) {
        guard isConnected else { return }
        if let json = Commands.message(message) {
            socket?.send(json)
        }
    }

    func send(_ uri: URI? = nil) {
        guard isConnected else {
            connect()
            return
        }
        if let json = Commands.send(uri: uri) {
            register()
            socket?.send(json)
        }
    }

    func button(_ type: CommunicatorButton) {
        guard isConnected else {
            connect()
            return
        }
        buttonType = type
        if let client = clientSocket {
            client.send(type.message) { _ in }
            return
        }
        send(.getInputSocket)
    }
}

