//
//  ActivityView.swift
//  Fractione
//
//  Created by Ludovic Ollagnier on 21/06/2021.
//

import SwiftUI

struct ActivityView: View {

    var heartRate: Int = 80
    var distance: Double = 350
    var timeElapsed: Int = 96

    var body: some View {
        VStack {
            HStack {
                HeartBeatView(heartRate: heartRate, sideBySide: false)
                VStack(alignment: .trailing) {
                    Text("\(timeElapsed.formatted(allowedUnits: [.minute, .second]))")
                        .bold()
                        .foregroundColor(.yellow)
                    Text("\(Int(distance))m")
                        .foregroundColor(.green)
                }
            }

            StepView(step: Step(kind: .run, objective: .duration(objective: 40), limit: nil, isCurrent: true))
            StepView(step: Step(kind: .recover, objective: .duration(objective: 40), limit: nil, isCurrent: true))
                .scaleEffect(0.9)
                .opacity(0.5)

        }
    }
}

extension Int {
    func formatted(allowedUnits: NSCalendar.Unit = [.hour, .minute]) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = allowedUnits
        formatter.unitsStyle = .short
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: DateComponents(second: self)) ?? ""
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
