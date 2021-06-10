//
//  FidelityApp.swift
//  FidelityWatch Extension
//
//  Created by Ludovic Ollagnier on 10/06/2021.
//

import SwiftUI

@main
struct FidelityApp: App {
    
    @StateObject private var appData = AppData()
    
    @SceneBuilder var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView {
                    CardList()
                }.tabItem {
                    Label("Fidelity Cards", systemImage: "giftcard.fill")
                }
                Text("Test")
                    .tabItem {
                        Label("Settings", systemImage: "gearshape.fill")
                    }
            }.environmentObject(appData)
        }
        
        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
