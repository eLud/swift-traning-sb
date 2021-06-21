//
//  ContentView.swift
//  FracWatch WatchKit Extension
//
//  Created by Ludovic Ollagnier on 21/06/2021.
//

import SwiftUI

struct ContentView: View {

    @State var selection = 1
    
    var body: some View {
        TabView(selection: $selection) {
            Text("Controls")
                .tag(0)
            ActivityView()
                .tag(1)
            WorkoutView(workout: .previewWorkout)
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
