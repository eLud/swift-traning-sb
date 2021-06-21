//
//  Serie.swift
//  Fractione
//
//  Created by Ludovic Ollagnier on 21/06/2021.
//

import Foundation

struct Serie: Identifiable {
    let serieNumber: Int
    let steps: [Step]
    let id = UUID()

    static let previewSerie = Serie(serieNumber: 1, steps: Step.previewSteps)
    static let previewSerieRecover = Serie(serieNumber: 2, steps: [Step(kind: .recover, objective: .duration(objective: 60), limit: nil, isCurrent: false)])
    static let previewSerie1 = Serie(serieNumber: 3, steps: Step.previewSteps)
}
