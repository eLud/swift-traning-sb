//
//  ColumnRootView.swift
//  SwiftUI_Intro
//
//  Created by Ludovic Ollagnier on 09/06/2021.
//

import SwiftUI

struct ColumnRootView: View {
    
    @State private var selectedString: String?
    
    var body: some View {
        NavigationView {
            List {
                Button("Beer View") {
                    selectedString = "BeerView"
                }
                Button("Static List") {
                    selectedString = "Static List"
                }
                Text("Dynamic List")
                Text("Dynamic List with ID")
            }.listStyle(.sidebar)
            if let string = selectedString {
                Text(string)
            } else {
                Text("Selected something")
            }
            Text("Detail")
        }
    }
}

struct ColumnRootView_Previews: PreviewProvider {
    static var previews: some View {
        ColumnRootView()
    }
}
