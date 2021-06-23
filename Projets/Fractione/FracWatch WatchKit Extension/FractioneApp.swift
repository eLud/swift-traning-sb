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
    @StateObject var locationManager = LocationDataManager()

    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                WorkoutChoiceView()
            }.environmentObject(healthManager)
                .environmentObject(locationManager)
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
