//
//  DynamicListIdentifiable.swift
//  SwiftUI_Intro
//
//  Created by Ludovic Ollagnier on 01/06/2021.
//

import SwiftUI

struct Card: Identifiable {

    let cardNumber: String
    var active: Bool = false

//    var id: String {
//        cardNumber
//    }

    let id: UUID = UUID()
}

struct DynamicListIdentifiable: View {

    // @Qqchose : Property Wrapper
    // Var qui participe à l'état de la vue
    // Définit la "source de vérité"
    @State private var cards: [Card] = [Card(cardNumber: "2345678"), Card(cardNumber: "876543")]
    @AppStorage("username") private var username: String = "Ludovic"

    var body: some View {
        VStack {
            HStack {
                Button("Add Card") {
                    withAnimation {
                        cards.append(Card(cardNumber: "\(Int.random(in: 0...1000000000000))"))
                    }
                }
                Button("Remove Card") {
                    cards.remove(at: Int.random(in: 0..<cards.count))
                }
                Button("Shuffle Card") {
                    cards.shuffle()
                }
            }
            TextField("FirstName", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("FirstName", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Text(username)
            List($cards) { $card in
                HStack {
                    Text(card.cardNumber)
                        .foregroundColor(card.active ? Color.black : Color.gray)
                    Spacer()
                    Toggle("", isOn: $card.active)
                    ActiveIndicator(isActive: $card.active)
                }
            }
        }
    }
}

struct DynamicListIdentifiable_Previews: PreviewProvider {
    static var previews: some View {
        DynamicListIdentifiable()
    }
}
