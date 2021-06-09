//
//  ColoredSymbolView.swift
//  SwiftUI_Intro
//
//  Created by Ludovic Ollagnier on 09/06/2021.
//

import SwiftUI

struct ColoredSymbolView: View {
    
    let symbolName: String
    let color: Color
    
    var body: some View {
        GeometryReader { geop in
            ZStack {
                color
                Image(systemName: symbolName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geop.size.width / 2)
//                Text("Safe inset is \(String(describing: geop.safeAreaInsets))")
//                    .foregroundColor(.white)
            }.edgesIgnoringSafeArea(.all)
        }
        .navigationTitle(symbolName)
    }
}

struct ColoredSymbolView_Previews: PreviewProvider {
    static var previews: some View {
        ColoredSymbolView(symbolName: "hand.thumbsup.circle.fill", color: .yellow)
    }
}
