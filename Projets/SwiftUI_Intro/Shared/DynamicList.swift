//
//  DynamicList.swift
//  SwiftUI_Intro
//
//  Created by Ludovic Ollagnier on 01/06/2021.
//

import SwiftUI

struct DynamicList: View {

    var data = ["hand.thumbsup.circle.fill", "hand.thumbsup.fill", "hand.thumbsdown.fill", "hand.thumbsdown.circle.fill", "rectangle.and.hand.point.up.left.fill"]
    
    var body: some View {
        NavigationView {
            List(data, id: \.self) { element in
                NavigationLink(destination:
                                TextImageView(text: element, symbolName: element)) {
                    HStack {
                        Text(element)
                        Spacer()
                        Image(systemName: element)
                    }
                }
            }
            .navigationTitle("Dynamic List")
        }
    }
}

struct DynamicList_Previews: PreviewProvider {
    static var previews: some View {
        DynamicList()
    }
}
