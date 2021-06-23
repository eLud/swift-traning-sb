//
//  WorkoutChoiceView.swift
//  Fractione
//
//  Created by Ludovic Ollagnier on 23/06/2021.
//

import SwiftUI
import HealthKit

struct WorkoutChoiceView: View {

    let workoutChoices: [HKWorkoutActivityType] = [.cycling, .running, .walking, .yoga, .highIntensityIntervalTraining]

    var body: some View {
        List (workoutChoices) { wk in
            NavigationLink(destination: TrainingChoiceView(activityType: wk)) {
                Text(wk.name)
            }
        }.navigationTitle("Workout")
    }
}

extension HKWorkoutActivityType: Identifiable {

    public var id: HKWorkoutActivityType {
        self
    }

    var name: String {
        switch self {
        case .cycling:
            return "Cycling"
        case .running:
            return "Running"
        case .walking:
            return "Walking"
        case .yoga:
            return "Yoga"
        case .highIntensityIntervalTraining:
            return "HIIT"
        default:
            return ""
        }
    }

}

struct WorkoutChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WorkoutChoiceView()
        }
    }
}
