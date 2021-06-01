//
//  CardList.swift
//  Fidelity
//
//  Created by Ludovic Ollagnier on 01/06/2021.
//

import SwiftUI

struct CardList: View {
    var body: some View {
        List {
            CardHeader(card: Card.demoCard)
            CardHeader(card: Card.demoCardWithoutShop)
        }
    }
}

struct CardList_Previews: PreviewProvider {
    static var previews: some View {
        CardList()
    }
}
