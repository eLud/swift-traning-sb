//
//  Card.swift
//  Fidelity
//
//  Created by Ludovic Ollagnier on 01/06/2021.
//

import Foundation

// Carte (struct)
// - Numéro de carte
// - Magasin d'origine
// - Nom du titulaire
// - Date de validité
// - Est valide?
// - Est carte de paiement?
// - Solde de points (si utile)

struct Card {
    let cardNumber: String
    let originBrand: Brand
    let ownerName: String
    var validityDate: Date?
    var isPayment: Bool
    var pointsAvailable: Int
    
    // Computed property get-only
    var isValid: Bool {
        if let validity = validityDate {
            let currentDate = Date()
            return validity > currentDate
        }
        return true
    }


    init(cardNumber: String, originBrand: Brand, ownerName: String, validityDate: Date?) {
        self.cardNumber = cardNumber
        self.originBrand = originBrand
        self.ownerName = ownerName
        self.validityDate = validityDate
        self.isPayment = false
        self.pointsAvailable = 0
    }

    static var demoCard: Card {
        let fnac = Brand(name: "Fnac")
        let shop = Shop(brand: fnac, location: (48.911853, 2.033865), adress: "Chambourcy")

        fnac.addShop(shop: shop)
        fnac.favoriteShop = shop

        return Card(cardNumber: "087652345678", originBrand: fnac, ownerName: "Ludovic Ollagnier", validityDate: Date())
    }
}
