//
//  StaticList.swift
//  SwiftUI_Intro
//
//  Created by Ludovic Ollagnier on 01/06/2021.
//

import SwiftUI

struct StaticList: View {
    var body: some View {
        List {
            Text("A")
            Section(header: Text("Truc")) {
                Text("B")
                Text("C")
                Text("D")
                Text("E")
            }
            Text("F")
            Text("G")
            Text("H")
            Text("I")
            Image(systemName: "creditcard")
            Image(systemName: "creditcard.fill")
            Button("Save") {}
        }
    }
}

struct StaticList_Previews: PreviewProvider {
    static var previews: some View {
        StaticList()
    }
}
