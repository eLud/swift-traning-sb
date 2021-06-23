//
//  TrainingChoiceView.swift
//  Fractione
//
//  Created by Ludovic Ollagnier on 23/06/2021.
//

import SwiftUI
import HealthKit

struct TrainingChoiceView: View {

    let activityType: HKWorkoutActivityType
    @State private var onGoingWorkout: Workout?

    var body: some View {
        List {
            Button("Free") {
                startTraining(with: Workout(cycles: [],
                                            type: activityType,
                                            name: "Free training"))
            }
            Section(header: Text("My workouts")) {
                ForEach(Workout.allWorkouts(of: activityType)) { wk in
                    Button(wk.name) {
                        startTraining(with: wk)
                    }
                }
            }
        }.navigationTitle(activityType.name)
            .sheet(item: $onGoingWorkout) {
                // Code executed on dismiss
            } content: { workout in
                OnGoingWorkoutView(currentWorkout: workout)
            }

    }

    private func startTraining(with workout: Workout) {
        self.onGoingWorkout = workout
    }
}

struct TrainingChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TrainingChoiceView(activityType: .running)
            TrainingChoiceView(activityType: .yoga)
        }
    }
}
