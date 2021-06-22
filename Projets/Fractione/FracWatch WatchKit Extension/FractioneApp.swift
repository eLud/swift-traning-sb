//
//  FractioneApp.swift
//  FracWatch WatchKit Extension
//
//  Created by Ludovic Ollagnier on 21/06/2021.
//

import SwiftUI

@main
struct FractioneApp: App {

    @StateObject var healthManager = HealtKitDataManager()

    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .environmentObject(healthManager)
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
