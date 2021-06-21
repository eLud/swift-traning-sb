//
//  WorkoutView.swift
//  Fractione
//
//  Created by Ludovic Ollagnier on 21/06/2021.
//

import SwiftUI

struct WorkoutView: View {

    let workout: Workout

    var body: some View {
        VStack {
            InfoView(heartRate: 120,
                     currentIntervalTime: 60,
                     ascent: 40)
            ScrollView {
                ForEach(workout.cycles) { c in
                    CycleView(cycle: c)
                }
            }
        }
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView(workout: Workout.previewWorkout)
    }
}
