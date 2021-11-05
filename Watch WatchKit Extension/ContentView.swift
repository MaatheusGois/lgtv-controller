//
//  ContentView.swift
//  Watch WatchKit Extension
//
//  Created by Matheus Gois on 05/11/21.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var socketHelper = SocketHelper(url: .init(string: "ws://192.168.18.3:3000")!)

    var body: some View {
        ScrollView {
            GridCell(.init(image: socketHelper.state, action: {
                socketHelper.send(.volumeDown)
            }))

            menu()
            volume()
            apps()
        }
        .padding()
        .ignoresSafeArea(.all)
        .padding(.bottom)
        .alert(
            socketHelper.error,
            isPresented: $socketHelper.errorIsPresented
        ) {
            Button("OK", role: .none) {
                socketHelper.errorIsPresented = false
            }
        }
    }

    func menu() -> some View {
        VStack {
            HStack {
                GridCell(.init(image: .home, action: {
                    socketHelper.send(.volumeDown)
                }))

                GridCell(.init(image: .up, action: {
                }))

                GridCell(.init(image: .apps, action: {
                    socketHelper.send(.volumeUp)
                }))
            }

            HStack {
                GridCell(.init(image: .left, action: {
                    socketHelper.send(.volumeDown)
                }))

                GridCell(.init(image: .center, action: {
                }))

                GridCell(.init(image: .right, action: {
                    socketHelper.send(.volumeUp)
                }))
            }

            HStack {
                GridCell(.init(image: .back, action: {
                    socketHelper.send(.volumeDown)
                }))

                GridCell(.init(image: .down, action: {
                }))

                GridCell(.init(image: .exit, action: {
                    socketHelper.send(.volumeUp)
                }))
            }
        }
    }

    func volume() -> some View {
        HStack {
            GridCell(.init(image: .down, action: {
                socketHelper.send(.volumeDown)
            }))

            GridCell(.init(image: .vol, action: {
            }))

            GridCell(.init(image: .up, action: {
                socketHelper.send(.volumeUp)
            }))
        }
    }

    func apps() -> some View {
        HStack {
            GridCell(.init(image: .amazon, action: {
                socketHelper.send(.volumeDown)
            }))

            GridCell(.init(image: .netflix, action: {
            }))

            GridCell(.init(image: .youtube, action: {
                socketHelper.send(.volumeUp)
            }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
