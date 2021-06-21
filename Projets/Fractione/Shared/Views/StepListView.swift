//
//  StepListView.swift
//  Fractione
//
//  Created by Ludovic Ollagnier on 21/06/2021.
//

import SwiftUI

struct StepListView: View {

    let steps: [Step]

    var body: some View {
        VStack() {
            ForEach(steps) { step in
                StepView(step: step)
            }
        }
    }
}

struct StepListView_Previews: PreviewProvider {
    static var previews: some View {
        StepListView(steps: Step.previewSteps)
    }
}
