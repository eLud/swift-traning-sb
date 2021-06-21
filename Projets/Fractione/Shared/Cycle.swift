//
//  Cycle.swift
//  Fractione
//
//  Created by Ludovic Ollagnier on 21/06/2021.
//

import Foundation

struct Cycle: Identifiable {
    let cycleNumber: Int
    let series: [Serie]
    let id = UUID()

    static let previewCycle = Cycle(cycleNumber: 1, series: [Serie.previewSerie, Serie.previewSerieRecover, Serie.previewSerie1])
    static let previewCycle1 = Cycle(cycleNumber: 2, series: [Serie.previewSerie, Serie.previewSerieRecover, Serie.previewSerie1])

}
