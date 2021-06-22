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

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(healthManager)
                .environmentObject(locationManager)
        }
    }
}
