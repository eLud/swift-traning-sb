//
//  UserIDCard.swift
//  SwiftUI_Intro
//
//  Created by Ludovic Ollagnier on 08/06/2021.
//

import SwiftUI

struct UserIDCard: View {

    // Comme @Binding pour les objets
    // Utilise une source de vérité "tierce" passée en paramètre
    // UserIDCard "ne possède pas" la vérité
    // UserIDCard(user: laSourceDeVérité)
    @ObservedObject var user: UserData

    var body: some View {
        VStack {
            Text(user.name)
            Text("\(user.age)")
            Text(user.job)
            Toggle("Is French", isOn: $user.isFrench)
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
