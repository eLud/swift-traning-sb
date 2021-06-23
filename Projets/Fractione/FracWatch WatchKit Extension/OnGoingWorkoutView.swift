//
//  ContentView.swift
//  FracWatch WatchKit Extension
//
//  Created by Ludovic Ollagnier on 21/06/2021.
//

import SwiftUI

struct OnGoingWorkoutView: View {

    @State private var selection = 1
    let currentWorkout: Workout

    @EnvironmentObject var healthManager: HealtKitDataManager
    @EnvironmentObject var locationManager: LocationDataManager

    var body: some View {
        TabView(selection: $selection) {
            ControlsView(tabSelection: $selection)
                .tag(0)
            ActivityView()
                .tag(1)
            if !currentWorkout.cycles.isEmpty {
                WorkoutView(workout: .previewWorkout)
                    .tag(2)
            }
        }.onAppear {
            healthManager.startHeartRateUpdate()
            healthManager.startWorkout(type: currentWorkout.type)
            locationManager.startLocationUpdates()
        }
    }
}

struct OnGoingWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        OnGoingWorkoutView(currentWorkout: .previewWorkout)
    }
}
