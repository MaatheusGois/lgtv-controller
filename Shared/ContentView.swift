//
//  ContentView.swift
//  Shared
//
//  Created by Matheus Gois on 02/11/21.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var socketHelper = SocketHelper(url: .init(string: "ws://192.168.18.3:3000")!)

    var body: some View {
        VStack {
            Text("Socket: \(socketHelper.isOpen ? "ON" : "OFF")")
                .padding()

            Button("Connect Socket") {
                socketHelper.connect()
            }.padding()

            Button("Connect TV") {
                socketHelper.register()
            }.padding()

            Button("Show message") {
                socketHelper.showToast(message: "Message")
            }.padding()

            Button("Turn off") {
                socketHelper.turnOff()
            }.padding()

        }.alert(
            socketHelper.error,
            isPresented: $socketHelper.errorIsPresented
        ) {
            Button("OK", role: .none) {
                socketHelper.errorIsPresented = false
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension LocalizedStringKey.StringInterpolation {
    mutating func appendInterpolation(_ value: Bool) {
        appendInterpolation(String(value))
    }
}
