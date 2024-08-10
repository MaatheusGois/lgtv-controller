//
//  HomeView.swift
//  Watch WatchKit Extension
//
//  Created by Matheus Gois on 05/11/21.
//

import SwiftUI

struct HomeView: View {

    @ObservedObject var socketHelper = SocketHelper()

    var body: some View {
        ZStack {
            content
        }
    }

    var content: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            ScrollView {
                GridCell(.init(image: socketHelper.state, action: {
                    socketHelper.connect()
                }))
                menu()
                volume()
                apps()
            }
            .alert(
                socketHelper.error,
                isPresented: $socketHelper.errorIsPresented
            ) {
                Button("OK", role: .none) {
                    Environment.shared.ip = ""
                    socketHelper.errorIsPresented = false
                }
            }.padding(.vertical)
        }
    }

    func menu() -> some View {
        VStack {
            HStack {
                GridCell(.init(image: .home, action: {
                    socketHelper.button(.home)
                }))

                GridCell(.init(image: .up, action: {
                    socketHelper.button(.up)
                }))

                GridCell(.init(image: .apps, action: {
                    socketHelper.button(.menu)
                }))
            }

            HStack {
                GridCell(.init(image: .left, action: {
                    socketHelper.button(.left)
                }))

                GridCell(.init(image: .center, action: {
                    socketHelper.button(.enter)
                }))

                GridCell(.init(image: .right, action: {
                    socketHelper.button(.right)
                }))
            }

            HStack {
                GridCell(.init(image: .back, action: {
                    socketHelper.button(.back)
                }))

                GridCell(.init(image: .down, action: {
                    socketHelper.button(.down)
                }))

                GridCell(.init(image: .exit, action: {
                    socketHelper.button(.exit)
                }))
            }
        }
    }

    func volume() -> some View {
        HStack {
            GridCell(.init(image: .down, action: {
                socketHelper.button(.volumeDown)
            }))

            GridCell(.init(image: .vol, action: {
            }))

            GridCell(.init(image: .up, action: {
                socketHelper.button(.volumeUp)
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
        HomeView()
    }
}
