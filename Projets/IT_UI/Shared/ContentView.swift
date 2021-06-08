//
//  ContentView.swift
//  Shared
//
//  Created by Serge BEAUFILS on 01/06/2021.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Fractionné court : 2 x (3 x 250m)")
                .font(.title2)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding()
            // ======
            HStack(alignment: .center, spacing: 0) {
                Text("1")
                    .font(.title3)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                    .frame(maxHeight: .infinity)
                    .padding()
                VStack {
                    Text("Serie 3 x 250m")
                        .padding()
                        .frame(maxWidth: .infinity)
                    SerieElement(serieNumber: 1, lapNumber: 4)
                    SerieElement(serieNumber: 2, lapNumber: 3)
                    SerieElement(serieNumber: 3, lapNumber: 2)
                        .padding(.bottom)
                }
                .padding(.trailing)
            }
            .background(
                LinearGradient(colors: [.green, .yellow], startPoint: .top, endPoint: .bottom))
            .cornerRadius(15)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        return ContentView()
    }
}

extension View {
    func oneStepView(txt: String) -> AnyView {
        return Text (txt)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.red) as! AnyView
    }
}
