//
//  FidelityApp.swift
//  Shared
//
//  Created by Ludovic Ollagnier on 01/06/2021.
//

import SwiftUI

@main
struct FidelityApp: App {
    
    @StateObject private var appData = AppData()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView {
                    CardList()
                }
                .tabItem {
                    Label("Fidelity Cards", systemImage: "giftcard.fill")
                }
                NavigationView {
                    SimpleCardList()
                }
                .tabItem {
                    Label("Simple Cards", systemImage: "creditcard.fill")
                }
                HeaderToCardView()
                    .tabItem {
                        Label("Header To Card", systemImage: "creditcard.fill")
                    }
            
                Text("This will be settings")
                    .tabItem {
                        Label("Settings", systemImage: "gearshape.fill")
                    }
                ShopMapView(shops: appData.shops)
                    .tabItem {
                        Label("Shop Map", systemImage: "map")
                    }
            }.environmentObject(appData)
        }
    }
}
