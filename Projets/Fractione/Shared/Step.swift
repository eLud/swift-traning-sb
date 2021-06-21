//
//  Step.swift
//  Fractione
//
//  Created by Ludovic Ollagnier on 21/06/2021.
//

import Foundation
import CoreText

struct Step: Identifiable {
    let kind: StepType
    let objective: StepObjective
    let limit: StepLimit?
    var isCurrent: Bool

    let id = UUID()

    static let previewSteps = [
                 Step(kind: .run, objective: .duration(objective: 300), limit: nil, isCurrent: true),
                 Step(kind: .cooldown, objective: .duration(objective: 300), limit: nil, isCurrent: false)
    ]
}

enum StepLimit {
    case pace(low: Int, high: Int)
    case heartRate(low: Int, high: Int)
    case cadence(low: Int, high: Int)
}

enum StepObjective {
    case duration(objective: TimeInterval)
    case distance(objective: Int)
    case heartRate(objective: Int)
    case manual(name: String, objective: Int)

    var displayedValue: String {
        switch self {
        case .duration(objective: let objective):
            return "\(Int(objective)) sec"
        case .distance(objective: let objective):
            return "\(objective) m"
        case .heartRate(objective: let objective):
            return "\(objective) bpm"
        case .manual(name: let name, objective: let objective):
            return "\(name) \(objective)"
        }
    }
}

enum StepType: String {
    case warmup
    case run
    case recover
    case rest
    case cooldown
    case other
}
