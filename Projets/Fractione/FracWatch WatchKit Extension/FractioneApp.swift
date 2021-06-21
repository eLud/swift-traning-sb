//
//  FractioneApp.swift
//  FracWatch WatchKit Extension
//
//  Created by Ludovic Ollagnier on 21/06/2021.
//

import SwiftUI

@main
struct FractioneApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
