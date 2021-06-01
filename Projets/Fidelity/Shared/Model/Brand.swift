//
//  Brand.swift
//  Fidelity
//
//  Created by Ludovic Ollagnier on 01/06/2021.
//

import Foundation

// Enseigne (class)
// - Nom de l'enseigne
// - Magasin préféré
// - Liste des magasins

class Brand {
    let brandName: String
    var favoriteShop: Shop?
    var allShops: [Shop]

    init(name: String) {
        brandName = name
        favoriteShop = nil
        allShops = []
    }

    func addShop(shop: Shop) {
        allShops.append(shop)
    }
}
