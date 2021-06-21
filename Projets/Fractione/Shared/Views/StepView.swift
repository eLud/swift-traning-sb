//
//  StepView.swift
//  Fractione
//
//  Created by Ludovic Ollagnier on 21/06/2021.
//

import SwiftUI

struct StepView: View {

    let step: Step

    var body: some View {
        HStack {
            Spacer()
            Text("\(step.objective.displayedValue)")
            Text("\(step.kind.rawValue.capitalized)")
            Spacer()
        }
        .foregroundColor(step.isCurrent ? .primary : .secondary)
        .padding()
        .background(RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(.black))
    }
}

struct StepView_Previews: PreviewProvider {
    static var previews: some View {
        let step1 = Step(kind: .run, objective: .distance(objective: 250), limit: nil, isCurrent: true)
        let step2 = Step(kind: .recover, objective: .duration(objective: 30), limit: nil, isCurrent: false)
        return Group {
            StepView(step: step1)
                .previewLayout(.fixed(width: 200, height: 44))
            StepView(step: step2)
                .previewLayout(.fixed(width: 200, height: 44))
        }

    }
}
