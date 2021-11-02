//
//  SocketManager.swift
//  lgtv-controller
//
//  Created by Matheus Gois on 22/10/21.
//

import WebSocket
import Foundation
import SwiftUI
import Combine

class SocketHelper: ObservableObject {

    let socket = WebSocket(url: URL(string: "ws://192.168.18.3:3000")!)
    var sub: AnyCancellable?

    @Published var isOpen = false

    init() {
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
                    self.socket.send(Data())
                case .success(let incoming):
                    print("Received \(incoming)")
                case .failure:
                    self.socket.close()
                }
            }
        )
    }


    func connect() {

        socket.connect()
    }
}

