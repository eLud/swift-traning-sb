//
//  SerieElement.swift
//  IT_UI
//
//  Created by Ludovic Ollagnier on 08/06/2021.
//

import SwiftUI

struct SerieElement: View {
    
    let serieNumber: Int
    let lapNumber: Int
    
    var body: some View {
        HStack {
            Text("\(serieNumber)")
                .padding()
            VStack(spacing: 0) {
                ForEach(0..<lapNumber) { _ in
                    HStack {
                        Text ("Run 250m")
                            .padding()
                            .frame(maxWidth: .infinity)
                        .background(Color.red)
                        Image(systemName: "")
                    }
                    Divider()
                        .frame(height: 2)
                }
            }
        }
        .background(Color.orange)
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}

struct SerieElement_Previews: PreviewProvider {
    static var previews: some View {
        SerieElement(serieNumber: 1, lapNumber: 4)
            .previewLayout(.sizeThatFits)
    }
}
