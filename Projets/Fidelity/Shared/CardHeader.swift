//
//  CardHeader.swift
//  Fidelity
//
//  Created by Ludovic Ollagnier on 01/06/2021.
//

import SwiftUI

struct CardHeader: View {

    let card: Card

    var body: some View {
        VStack {
            HStack {
                Text(card.originBrand.brandName)
                    .font(.title)
                    .bold()
                Spacer()
                Text(card.ownerName)
                    .font(.title2)
            }
            if let validity = card.validityDate {
                HStack {
                    Text("Validity:")
                    Text(validity, style: .date)
                    Spacer()
                }
                .font(.callout)
            }
        }
    }
}


struct CardHeader_Previews: PreviewProvider {
    static var previews: some View {

        return CardHeader(card: Card.demoCard)
            .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/300.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/60.0/*@END_MENU_TOKEN@*/))
    }
}
