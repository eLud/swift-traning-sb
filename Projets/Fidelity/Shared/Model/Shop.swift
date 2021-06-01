//
//  Shop.swift
//  Fidelity
//
//  Created by Ludovic Ollagnier on 01/06/2021.
//

import Foundation

// Magasin
// - Enseigne parente
// - Lieu (coord)
// - Lieu (adresse)

struct Shop {
    var brand: Brand?
    let location: (Double, Double)
    let adress: String
}
