//
//  FractioneApp.swift
//  Shared
//
//  Created by Ludovic Ollagnier on 21/06/2021.
//

import SwiftUI

@main
struct FractioneApp: App {

    @StateObject var healthManager = HealtKitDataManager()
    @StateObject var locationManager = LocationDataManager()
    @StateObject var sessionManager = SessionDataManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(healthManager)
                .environmentObject(locationManager)
                .environmentObject(sessionManager)
        }
    }
}
