//
//  DynamicList.swift
//  SwiftUI_Intro
//
//  Created by Ludovic Ollagnier on 01/06/2021.
//

import SwiftUI

struct DynamicList: View {

    var data = ["A", "B", "C", "D", "E"]

    var body: some View {
        List(data, id: \.self) { element in
            HStack {
                Text(element)
                Spacer()
                Image(systemName: "creditcard")
            }
        }
    }
}

struct DynamicList_Previews: PreviewProvider {
    static var previews: some View {
        DynamicList()
    }
}
