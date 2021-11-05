//
//  SocketManager.swift
//  lgtv-controller
//
//  Created by Matheus Gois on 22/10/21.
//

import WebSocket
import WebSocketProtocol
import Foundation
import SwiftUI
import Combine

// Class

class SocketHelper: ObservableObject {

    // Internal

    internal lazy var socket = WebSocket(url: url)

    // Private

    private var sub: AnyCancellable?
    private let url: URL

    // Published

    @Published var isOpen = false
    @Published var errorIsPresented = false
    @Published var error: String = .empty

    // Computed

    var state: String { isOpen ? "ON" : "OFF" }

    // Lifecycle

    init(url: URL) {
        self.url = url
        setupSocket()
    }

    // Methods

    func setupSocket() {
        sub = socket.sink(
            receiveCompletion: {
                print("Socket closed: \(String(describing: $0))")
            },
            receiveValue: { (result) in
                switch result {
                case .success(.open):
                    DispatchQueue.main.async {
                        self.isOpen = true
                    }
                    print("Socket is open...")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.register()
                    }
                case .success(let data):
                    print("Received \(data)")
                    self.receiveData(data: data)
                case .failure:
                    self.socket.close()
                }
            }
        )
    }

    func connect() {
        socket.connect()
    }

    func register() {
        guard isOpen else { return }
        if let json = Commands.register() {
            socket.send(json)
        }
    }

    func receiveData(data: WebSocketMessage) {
        if let model = data.description.model(type: Communicator.self) {
            switch model.type {
            case .error:
                error(model.error)
            case .registered:
                registered(model)
            default:
                break
            }
        }
    }

    func error(_ error: String? = nil) {
        DispatchQueue.main.async {
            self.errorIsPresented = true
            self.error = error ?? "Problemas de conexão"
        }
    }

    func registered(_ model: Communicator) {
        if let clientKey = model.payload?.clientKey {
            DataStorage.clientKey = clientKey
            showToast(message: "success.connection".localized)
        } else {
            error()
        }
    }

    func showToast(message: String) {
        guard isOpen else { return }
        if let json = Commands.message(message) {
            socket.send(json)
        }
    }

    func turnOff() {
        guard isOpen else { return }
        if let json = Commands.turnOff() {
            socket.send(json)
        }
    }
}

