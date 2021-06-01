//
//  DynamicListIdentifiable.swift
//  SwiftUI_Intro
//
//  Created by Ludovic Ollagnier on 01/06/2021.
//

import SwiftUI

struct Card: Identifiable {

    let cardNumber: String

    var id: String {
        cardNumber
    }

//    var id: UUID {
//        return UUID()
//    }
}

struct DynamicListIdentifiable: View {

    @State var cards: [Card] = [Card(cardNumber: "2345678"), Card(cardNumber: "876543")]

    var body: some View {
        VStack {
            HStack {
                Button("Add Card") {
                    cards.append(Card(cardNumber: "\(Int.random(in: 0...1000000000000))"))
                }
                Button("Remove Card") {
                    cards.remove(at: Int.random(in: 0..<cards.count))
                }
            }
            List(cards) { card in
                Text(card.cardNumber)
            }
            .animation(.easeIn)
        }
    }
}

struct DynamicListIdentifiable_Previews: PreviewProvider {
    static var previews: some View {
        DynamicListIdentifiable()
    }
}
