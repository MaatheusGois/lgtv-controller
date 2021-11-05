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
                    .padding(.top, 40)
                    .ignoresSafeArea(.all)
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}

struct ContentView_Previews_Watch: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "Apple Watch Series 6 - 44mm"))
    }
}
