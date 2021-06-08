//
//  UserIDCard.swift
//  SwiftUI_Intro
//
//  Created by Ludovic Ollagnier on 08/06/2021.
//

import SwiftUI

struct UserIDCard: View {

    // Comme @Binding pour les objets
    @ObservedObject var user: UserData

    var body: some View {
        VStack {
            Text(user.name)
            Text("\(user.age)")
            Text(user.job)
        }
        .padding()
        .background(Color.yellow)
        .cornerRadius(10)
    }
}

struct UserIDCard_Previews: PreviewProvider {
    static var previews: some View {
        UserIDCard(user: UserData())
    }
}
