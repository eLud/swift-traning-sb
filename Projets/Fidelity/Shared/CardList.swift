//
//  CardList.swift
//  Fidelity
//
//  Created by Ludovic Ollagnier on 01/06/2021.
//

import SwiftUI

struct CardList: View {
    
    @EnvironmentObject var appData: AppData
    
    @State private var selectedCard: Card?
    @GestureState private var offset = CGSize.zero
    
    var body: some View {
        ZStack {
            List(appData.cards) { card in
                NavigationLink(destination: CardView(card: card)) {
                    HStack {
                        CardHeader(card: card)
                        Button {
                            selectedCard = card
                        } label: {
                            Image(systemName: "info.circle")
                        }.buttonStyle(.plain)
                    }
                }
            }
            if let selectedCard = selectedCard {
                Group {
                    Rectangle()
                    #if !os(watchOS)
                        .foregroundStyle(Material.ultraThin)
                    #endif
                        .edgesIgnoringSafeArea(.all)
                    VStack {
                        Text("Dismiss")
                        Image(systemName: "arrow.down.circle")
                    }.opacity((offset.height - 250.0)/100)
                    CardView(card: selectedCard)
                        .offset(offset)
                        .animation(.easeInOut(duration: 0.2), value: offset)
                        .gesture(dragGesture)
                }
                .transition(.opacity)
                .onTapGesture {
                    withAnimation {
                        self.selectedCard = nil
                    }
                }
            }
        }
        .navigationTitle("Test")
    }
    
    var dragGesture: some Gesture {
        DragGesture()
            .updating($offset, body: { value, state, _ in
                state = value.translation
            })
            .onEnded({ value in
                if value.translation.height > 250 {
                    self.selectedCard = nil
                }
            })
    }
}

struct CardList_Previews: PreviewProvider {
    static var previews: some View {
        CardList()
            .environmentObject(AppData())
    }
}
