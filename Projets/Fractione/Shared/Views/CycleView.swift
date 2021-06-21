//
//  CycleView.swift
//  Fractione
//
//  Created by Ludovic Ollagnier on 21/06/2021.
//

import SwiftUI

struct CycleView: View {

    let cycle: Cycle

    var body: some View {
        VStack {
            InfoView(heartRate: 120,
                     currentIntervalTime: 60,
                     ascent: 40)
            ZStack {
                Color.green
                    .cornerRadius(8)
                    .edgesIgnoringSafeArea(.bottom)
                HStack {
                    Text("\(cycle.cycleNumber)")
                        .padding(6)
                    Spacer()
                }

                VStack {
                    Text("Cycle \(cycle.cycleNumber)")
                    ScrollView {
                        ForEach(cycle.series) { s in
                            SerieView(serie: s)
                        }
                        .padding(.leading, 20)
                    }
                }
                HStack {
                    Text("\(cycle.series.first?.serieNumber ?? 0)")
                    Spacer()
                }.padding(26)
            }
        }
    }
}

struct CycleView_Previews: PreviewProvider {
    static var previews: some View {
        CycleView(cycle: Cycle.previewCycle)
    }
}
