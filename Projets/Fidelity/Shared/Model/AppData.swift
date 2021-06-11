//
//  AppData.swift
//  Fidelity
//
//  Created by Ludovic Ollagnier on 09/06/2021.
//

import Foundation

class AppData: ObservableObject {
    
    @Published var cards: [Card]
    @Published var shops: [Shop]
    @Published var brands: [Brand]

    var favoritesCards: [Card] {
        cards.filter { card in
            card.isFavorite
        }
    }
    
    init() {
        cards = []
        shops = []
        
        let lm = Brand(name: "Leroy-Merlin")
        let ikea = Brand(name: "Ikea")
        let casto = Brand(name: "Castorama")
        brands = [lm, ikea, casto]
        
        let lm1 = Shop(brand: lm, location: randomLocation(), adress: "This is the address")
        let lm2 = Shop(brand: lm, location: randomLocation(), adress: "This is the address")
        let lm3 = Shop(brand: lm, location: randomLocation(), adress: "This is the address")
        lm.favoriteShop = lm1
        lm.allShops = [lm1, lm2, lm3]

        let ikea1 = Shop(brand: ikea, location: randomLocation(), adress: "This is the address")
        let ikea2 = Shop(brand: ikea, location: randomLocation(), adress: "This is the address")
        let ikea3 = Shop(brand: ikea, location: randomLocation(), adress: "This is the address")
        ikea.favoriteShop = ikea1
        ikea.allShops = [ikea1, ikea2, ikea3]
        
        let casto1 = Shop(brand: casto, location: randomLocation(), adress: "This is the address")
        let casto2 = Shop(brand: casto, location: randomLocation(), adress: "This is the address")
        let casto3 = Shop(brand: casto, location: randomLocation(), adress: "This is the address")
        casto.favoriteShop = casto1
        casto.allShops = [casto1, casto2, casto3]

        shops = [lm1, lm2, lm3, ikea1, ikea2, ikea3, casto1, casto2, casto3]
        
        let cardIkea = Card(cardNumber: "213456", originBrand: ikea, ownerName: "Ludovic", validityDate: nil)
        let cardCasto = Card(cardNumber: "875765765H", originBrand: casto, ownerName: "Ludovic", validityDate: nil)
        let cardLm = Card(cardNumber: "56RTFHJTHKU", originBrand: lm, ownerName: "Ludovic", validityDate: nil)
        cards = [cardIkea, cardCasto, cardLm]
    }
    
    private func randomLocation() -> (Double, Double) {
        let lat = Double.random(in: 42...50)
        let long = Double.random(in: (-5)...(8))
        
        return (lat, long)
    }
}
