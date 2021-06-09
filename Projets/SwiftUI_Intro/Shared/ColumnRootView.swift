//
//  ColumnRootView.swift
//  SwiftUI_Intro
//
//  Created by Ludovic Ollagnier on 09/06/2021.
//

import SwiftUI

struct ColumnRootView: View {
    
    @State private var defaultView = true
    
    var body: some View {
        NavigationView {
            List {
                Text("Example views")
                    .font(.caption)
                    .foregroundColor(.secondary)
                NavigationLink(destination: ContentView(), isActive: $defaultView) {
                    ContentView.navigationLabel
                }
                NavigationLink(destination: StaticList()) {
                    Label("Static List", systemImage: "list.bullet.rectangle.portrait")
                }
                NavigationLink(destination: DynamicList()) {
                    Label("Dynamic List", systemImage: "list.bullet.circle")
                }
                NavigationLink(destination: DynamicListIdentifiable()) {
                    Label("Dynamic List with ID", systemImage: "list.triangle")
                }
            }.listStyle(.sidebar)
            Text("Selected something")
            Text("Detail")
        }
    }
}

struct ColumnRootView_Previews: PreviewProvider {
    static var previews: some View {
        ColumnRootView()
    }
}
