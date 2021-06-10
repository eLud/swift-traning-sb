//
//  HeaderToCardView.swift
//  Fidelity
//
//  Created by Ludovic Ollagnier on 10/06/2021.
//

import SwiftUI

struct HeaderToCardView: View {
    
    @EnvironmentObject var appData: AppData
    @State private var displayedCard: Card?
    
    var body: some View {
        ZStack {
            List(appData.cards) { card in
                CardHeader(card: card)
                    .onTapGesture {
                        withAnimation {
                            displayedCard = card
                        }
                    }
            }
            if let displayedCard = displayedCard {
                CardView(card: displayedCard)
                    .transition(.scale.combined(with: .slide))
                    .onTapGesture {
                        withAnimation {
                            self.displayedCard = nil
                        }
                    }
            }
        }
    }
}

struct HeaderToCardView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderToCardView()
            .environmentObject(AppData())
    }
}
