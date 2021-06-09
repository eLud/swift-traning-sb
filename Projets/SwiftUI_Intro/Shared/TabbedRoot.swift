//
//  TabbedRoot.swift
//  SwiftUI_Intro
//
//  Created by Ludovic Ollagnier on 09/06/2021.
//

import SwiftUI

struct TabbedRoot: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Too Much", systemImage: "square.bottomhalf.filled")
                }
            StaticList()
                .tabItem {
                    Label("Static List", systemImage: "list.bullet.rectangle.portrait")
                }
            DynamicList()
                .tabItem {
                    Label("Dynamic List", systemImage: "list.bullet.circle")
                }
            DynamicListIdentifiable()
                .tabItem {
                    Label("Dynamic List Id", systemImage: "list.triangle")
                }
        }
    }
}

struct TabbedRoot_Previews: PreviewProvider {
    static var previews: some View {
        TabbedRoot()
    }
}