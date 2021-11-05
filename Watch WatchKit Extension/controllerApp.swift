//
//  controllerApp.swift
//  Watch WatchKit Extension
//
//  Created by Matheus Gois on 04/11/21.
//

import SwiftUI

@main
struct controllerApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
