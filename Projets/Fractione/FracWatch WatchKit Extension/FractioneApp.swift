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
                CycleView(cycle: Cycle.previewCycle)
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
