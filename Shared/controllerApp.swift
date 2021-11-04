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
            ContentView()
        }
    }
}

fileprivate extension controllerApp {
    func setupEnvironment() {
        Environment.shared.log = .uat
    }
}
