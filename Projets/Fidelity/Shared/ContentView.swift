//
//  ContentView.swift
//  Shared
//
//  Created by Ludovic Ollagnier on 01/06/2021.
//

import SwiftUI
import MapKit

struct ContentView: View {

    let card: Card

    var body: some View {
        VStack {
            CardHeader(card: card)
            Image(systemName: "creditcard")
                .resizable()
                .aspectRatio(contentMode: .fit)
            HStack {
                if let favorite = card.originBrand.favoriteShop {
                    Text(favorite.adress)
                        .italic()
                }
                Spacer()
                Text(card.cardNumber)
            }
        }
        .padding()
        .background(Color.yellow)
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {

        return ContentView(card: Card.demoCard)
    }
}
