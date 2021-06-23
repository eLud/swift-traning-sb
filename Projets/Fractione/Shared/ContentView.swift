//
//  ContentView.swift
//  Shared
//
//  Created by Ludovic Ollagnier on 21/06/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection = 1

    var body: some View {
        TabView(selection: $selection) {
            ControlsView(tabSelection: $selection)
                .tabItem({
                    Image(systemName: "switch.2")
                    Text("Controls")
                })
                .tag(0)
            ActivityView()
                .tabItem({
                    Image(systemName: "heart.fill")
                    Text("Activity")
                })
                .tag(1)
            WorkoutView(workout: .previewWorkout)
                .tabItem({
                    Image(systemName: "list.bullet.rectangle")
                    Text("Workout")
                })
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
