//
//  Cycle.swift
//  Fractione
//
//  Created by Ludovic Ollagnier on 21/06/2021.
//

import Foundation

struct Cycle {
    let cycleNumber: Int
    let series: [Serie]

    static let previewCycle = Cycle(cycleNumber: 1, series: [Serie.previewSerie, Serie.previewSerieRecover, Serie.previewSerie1])

}
