//
//  TextImageView.swift
//  SwiftUI_Intro
//
//  Created by Ludovic Ollagnier on 09/06/2021.
//

import SwiftUI

struct TextImageView: View {
    
    let text: String
    let symbolName: String
    
    var body: some View {
        VStack {
            Text(text)
            NavigationLink(destination: ColoredSymbolView(symbolName: symbolName, color: .random)) {
                Image(systemName: symbolName)
            }
        }
    }
}

struct TextImageView_Previews: PreviewProvider {
    static var previews: some View {
        TextImageView(text: "Thumbs up", symbolName: "hand.thumbsup.circle.fill")
    }
}

extension Color {
    static var random: Color {
        let red = Double.random(in: 0.0...1.0)
        let green = Double.random(in: 0.0...1.0)
        let blue = Double.random(in: 0.0...1.0)
        return Color(red: red, green: green, blue: blue, opacity: 1)
    }
}
