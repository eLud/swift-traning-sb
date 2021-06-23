//
//  Workout.swift
//  Fractione
//
//  Created by Ludovic Ollagnier on 21/06/2021.
//

import Foundation
import HealthKit

struct Workout: Identifiable {

    let cycles: [Cycle]
    let type: HKWorkoutActivityType
    let name: String
    let id = UUID()
    
    var currentCycle: Cycle? = nil
    var currentSerie: Serie? = nil
    var currentStep: Step? = nil

    static let previewWorkout = Workout(cycles: [Cycle.previewCycle, Cycle.previewCycle1], type: .running, name: "Running Preview 1")
    static let previewWorkout2 = Workout(cycles: [Cycle.previewCycle, Cycle.previewCycle1], type: .running, name: "Running Preview 2")
    static let previewWorkout3 = Workout(cycles: [Cycle.previewCycle, Cycle.previewCycle1], type: .walking, name: "Walking Preview 1")
    static let previewWorkout4 = Workout(cycles: [Cycle.previewCycle, Cycle.previewCycle1], type: .walking, name: "Walking Preview 2")
    static let previewWorkout5 = Workout(cycles: [Cycle.previewCycle, Cycle.previewCycle1], type: .yoga, name: "Yoga Preview")

    static let allWorkouts = [previewWorkout, previewWorkout2, previewWorkout3, previewWorkout4, previewWorkout5]

    static func allWorkouts(of type: HKWorkoutActivityType) -> [Workout] {
        allWorkouts.filter { wk in
            wk.type == type
        }
    }

}
