//
//  ContentView.swift
//  Shared
//
//  Created by Ludovic Ollagnier on 01/06/2021.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        ZStack {
            VStack {
                TooMuchBeerView(text: "Hello Swift", imageName: "doc.circle")
                TooMuchBeerView(text: "Hello SwiftUI", imageName: "calendar.circle.fill")
            }
        }
    }
}

struct TooMuchBeerView: View {

    var text: String
    var imageName: String

    var body: some View {
        VStack {
            Text(text)
                .customDesign()
            Image(systemName: imageName)
                .customDesign()
        }.customDesign(angle: -20)
    }
}

extension View {
    func customDesign(angle: Double = 50) -> some View {
        self.padding(20)
            .background(Color.red)
            .cornerRadius(10)
            .padding(5)
            .background(Color.green)
            .cornerRadius(10)
            .rotation3DEffect(
                Angle(degrees: angle),
                axis: (x: 0.0, y: 1.0, z: 0.6)
            )
            .shadow(radius: 10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
            ContentView()
                .preferredColorScheme(.dark)
                .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
        }
    }
}
