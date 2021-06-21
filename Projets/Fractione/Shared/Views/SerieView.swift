//
//  SerieView.swift
//  Fractione
//
//  Created by Ludovic Ollagnier on 21/06/2021.
//

import SwiftUI

struct SerieView: View {

    let serie: Serie
    
    var body: some View {
        ZStack {
            Color.orange
                .cornerRadius(10)
                .edgesIgnoringSafeArea(.bottom)
            HStack {
                Text("\(serie.serieNumber)")
                    .padding(6)
                Spacer()
            }
            VStack {
                Text("Serie \(serie.serieNumber)")
                StepListView(steps: serie.steps)
                    .padding(.leading, 20)
            }
        }
    }
}

struct SerialView_Previews: PreviewProvider {
    static var previews: some View {
        SerieView(serie: Serie.previewSerie)
    }
}
