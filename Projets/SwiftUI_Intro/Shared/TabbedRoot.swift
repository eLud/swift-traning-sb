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
                    ContentView.navigationLabel
                }
            NavigationView {
                StaticList()
            }.tabItem {
                Label("Static List", systemImage: "list.bullet.rectangle.portrait")
            }
            NavigationView {
                DynamicList()
            }.tabItem {
                Label("Dynamic List", systemImage: "list.bullet.circle")
            }
            NavigationView {
                DynamicListIdentifiable()
            }.tabItem {
                Label("Dynamic List Id", systemImage: "list.triangle")
            }
            UserView().tabItem {
                Label("User View", systemImage: "person.circle.fill")
            }
            MatchedEffect().tabItem {
                Label("Matched effect", systemImage: "person.circle.fill")
            }
            AnimatedChange()
                .tabItem {
                    Text("Animated Change")
                }
        }
    }
}

struct TabbedRoot_Previews: PreviewProvider {
    static var previews: some View {
        TabbedRoot()
    }
}
