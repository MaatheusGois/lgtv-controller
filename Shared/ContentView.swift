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

            HStack {
                Button("Conectar") {
                    socketHelper.connect()
                }.padding()
                Spacer()
                Text("title".localized(socketHelper.state))
                    .padding()
            }

            GridView(
                grid: [
                    .init(
                        title: "volumeUp",
                        action: {
                            socketHelper.send(.volumeUp)
                        }
                    ),
                    .init(
                        title: "volumeDown",
                        action: {
                            socketHelper.send(.volumeDown)
                        }
                    )
                ]
            )

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
