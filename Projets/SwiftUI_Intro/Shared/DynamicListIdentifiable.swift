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

    var id: UUID {
        return UUID()
    }
}

struct DynamicListIdentifiable: View {

    // @Qqchose : Property Wrapper
    // Var qui participe à l'état de la vue
    // Définit la "source de vérité"
    @State private var cards: [Card] = [Card(cardNumber: "2345678"), Card(cardNumber: "876543")]
    @State private var username: String = "Ludovic"

    var body: some View {
        VStack {
            HStack {
                Button("Add Card") {
                    cards.append(Card(cardNumber: "\(Int.random(in: 0...1000000000000))"))
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
            List {
                ForEach(0..<cards.count) { index in
                    HStack {
                        Text(cards[index].cardNumber)
                            .foregroundColor(cards[index].active ? Color(.label) : Color(.secondaryLabel))
                        Spacer()
                        Toggle("", isOn: $cards[index].active)
                        ActiveIndicator(isActive: $cards[index].active)
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .animation(.easeIn)
        }
    }
}

struct DynamicListIdentifiable_Previews: PreviewProvider {
    static var previews: some View {
        DynamicListIdentifiable()
    }
}
