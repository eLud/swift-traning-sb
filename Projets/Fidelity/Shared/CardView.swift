//
//  CardView.swift
//  Shared
//
//  Created by Ludovic Ollagnier on 01/06/2021.
//

import SwiftUI
import MapKit

struct CardView: View {

    let card: Card

    @State private var cardColor = Color("fnacColor")
    @State private var radius = 10.0

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
        .onLongPressGesture {
            withAnimation {
                cardColor = Color.random
                radius = Double.random(in: 0.0...50.0)
            }
        }
        .padding()
        .background(cardColor)
        .cornerRadius(radius)
        .shadow(radius: 10)
        .padding()
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {

        Group {
            CardView(card: Card.demoCard)
            CardView(card: Card.demoCardWithoutShop)
                .preferredColorScheme(.dark)
        }
    }
}
