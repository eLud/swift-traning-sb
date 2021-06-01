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
    let originBrand: String
    let ownerName: String
    var validityDate: Date?
    var isValid: Bool
    var isPayment: Bool
    var pointsAvailable: Int

    init(cardNumber: String, originBrand: String, ownerName: String, validityDate: Date?) {
        self.cardNumber = cardNumber
        self.originBrand = originBrand
        self.ownerName = ownerName
        self.validityDate = validityDate

        self.isValid = true
        self.isPayment = false
        self.pointsAvailable = 0
    }
}
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

// Magasin
// - Enseigne parente
// - Lieu (coord)
// - Lieu (adresse)

struct Shop {
    var brand: Brand?
    let location: (Double, Double)
    let adress: String
}


