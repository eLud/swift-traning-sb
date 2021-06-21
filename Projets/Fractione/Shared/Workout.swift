//
//  Workout.swift
//  Fractione
//
//  Created by Ludovic Ollagnier on 21/06/2021.
//

import Foundation

struct Workout: Identifiable {

    let cycles: [Cycle]
    let id = UUID()
    
    var currentCycle: Cycle? = nil
    var currentSerie: Serie? = nil
    var currentStep: Step? = nil

    static let previewWorkout = Workout(cycles: [Cycle.previewCycle, Cycle.previewCycle1])
}
