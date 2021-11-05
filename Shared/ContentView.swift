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
        List {
            HStack {
                GridCell(.init(image: socketHelper.state, action: {
                    socketHelper.connect()
                }))
                Spacer()
            }.listRowBackground(Color.background)
            HStack {
                GridCell(.init(image: .home, action: {
                    socketHelper.connect()
                }))

                Spacer()

                GridCell(.init(image: .up, action: {
                    socketHelper.connect()
                }))

                Spacer()

                GridCell(.init(image: .apps, action: {
                    socketHelper.connect()
                }))
            }.listRowBackground(Color.background)
            HStack {
                GridCell(.init(image: .left, action: {
                    socketHelper.connect()
                }))

                Spacer()

                GridCell(.init(image: .center, action: {
                    socketHelper.connect()
                }))

                Spacer()

                GridCell(.init(image: .right, action: {
                    socketHelper.connect()
                }))
            }.listRowBackground(Color.background)
            HStack {
                GridCell(.init(image: .back, action: {
                    socketHelper.connect()
                }))

                Spacer()

                GridCell(.init(image: .down, action: {
                    socketHelper.connect()
                }))

                Spacer()

                GridCell(.init(image: .exit, action: {
                    socketHelper.connect()
                }))
            }.listRowBackground(Color.background)
            HStack {
                GridCell(.init(image: .down, action: {
                    socketHelper.connect()
                }))

                Spacer()

                GridCell(.init(image: .vol, action: {
                    socketHelper.connect()
                }))

                Spacer()

                GridCell(.init(image: .up, action: {
                    socketHelper.connect()
                }))
            }.listRowBackground(Color.background)
            HStack {
                GridCell(.init(image: .amazon, action: {
                    socketHelper.connect()
                }))

                Spacer()

                GridCell(.init(image: .netflix, action: {
                    socketHelper.connect()
                }))

                Spacer()

                GridCell(.init(image: .youtube, action: {
                    socketHelper.connect()
                }))
            }.listRowBackground(Color.background)
        }
        .background(.background)
        .alert(
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
