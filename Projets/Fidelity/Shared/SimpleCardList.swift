//
//  SimpleCardList.swift
//  Fidelity
//
//  Created by Ludovic Ollagnier on 10/06/2021.
//

import SwiftUI

struct SimpleCardList: View {
    
    @EnvironmentObject var appData: AppData
//    @Environment(\.) var editMode: EditMode
    
    var body: some View {
        List {
            if !appData.favoritesCards.isEmpty {
                Section(header: Text("Favorites")) {
                    ForEach(appData.favoritesCards) { card in
                        Text(card.originBrand.brandName)
                    }
                }
            }
            Section(header: Text("All cards")) {
                ForEach(appData.cards) { card in
                    Text(card.originBrand.brandName)
                }.onDelete { indexSet in
                    appData.cards.remove(atOffsets: indexSet)
                }
                .onMove { indexSet, index in
                    appData.cards.move(fromOffsets: indexSet, toOffset: index)
                }
            }
        }.toolbar {
            #if os(iOS) || os(macOS)
            EditButton()
            #endif
        }
    }
}

struct SimpleCardList_Previews: PreviewProvider {
    static var previews: some View {
        SimpleCardList()
            .environmentObject(AppData())
    }
}
