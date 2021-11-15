//
//  controllerApp.swift
//  Shared
//
//  Created by Matheus Gois on 02/11/21.
//

import SwiftUI

@main
struct controllerApp: App {

    init() {
        setupEnvironment()
    }

    var body: some Scene {
        WindowGroup {
            HomeView()
            #if os(macOS)
                .frame(width: 230, height: 450)
            #endif
        }
    }
}

fileprivate extension controllerApp {
    func setupEnvironment() {
        Environment.shared.log = .uat
    }
}
