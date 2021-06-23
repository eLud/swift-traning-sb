//
//  TestWithCompanionApp.swift
//  TestWithCompanion WatchKit Extension
//
//  Created by Ludovic Ollagnier on 23/06/2021.
//

import SwiftUI

@main
struct TestWithCompanionApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
