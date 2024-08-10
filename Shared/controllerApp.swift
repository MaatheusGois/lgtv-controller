//
//  controllerApp.swift
//  Shared
//
//  Created by Matheus Gois on 02/11/21.
//

import SwiftUI

@main
struct controllerApp: App {
    @StateObject var environment = Environment.shared

    var body: some Scene {
        WindowGroup {
            VStack {
                if environment.ip.isEmpty {
                    SetupIPView()
                        .background(Color.black.ignoresSafeArea())
                        .frame(width: 230, height: 450)
                } else {
                    HomeView()
                        .environmentObject(environment)
                        #if os(macOS)
                        .frame(width: 230, height: 450)
                        #endif
                }
            }
        }.windowResizabilityContentSize()
    }
}

fileprivate extension controllerApp {
    func setupEnvironment() {
        environment.log = .uat
    }
}

extension Scene {
    func windowResizabilityContentSize() -> some Scene {
        if #available(macOS 13.0, *) {
            return windowResizability(.contentSize)
        } else {
            return self
        }
    }
}
