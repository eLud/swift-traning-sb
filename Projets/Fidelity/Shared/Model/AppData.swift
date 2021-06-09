//
//  AppData.swift
//  Fidelity
//
//  Created by Ludovic Ollagnier on 09/06/2021.
//

import Foundation

class AppData: ObservableObject {
    
    var cards: [Card]
    
    var favoritesCards: [Card] {
        cards.filter { card in
            card.isFavorite
        }
    }
    
    init() {
        cards = []
        cards.append(Card.demoCard)
        cards.append(Card.demoCardWithoutShop)
    }
}
