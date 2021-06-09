//
//  SwiftUI_IntroApp.swift
//  Shared
//
//  Created by Ludovic Ollagnier on 01/06/2021.
//

import SwiftUI

@main
struct SwiftUI_IntroApp: App {
    
    var body: some Scene {
        WindowGroup {
            #if os(macOS)
            ColumnRootView()
            #else
            if UIDevice.current.userInterfaceIdiom == .pad {
                ColumnRootView()
            } else {
                TabbedRoot()
            }
            #endif
        }
//        .windowToolbarStyle(.unifiedCompact)
    }
}
