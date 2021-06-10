//
//  UserView.swift
//  SwiftUI_Intro
//
//  Created by Ludovic Ollagnier on 08/06/2021.
//

import SwiftUI

struct UserView: View {

    // Comme @State mais pour objets
    // Défini la source de vérité
    // UserView "possède" la vérité
    @StateObject var user = UserData()

    var body: some View {
        VStack {
            Group {
                Text(user.name)
                Text("\(user.age)")
                Text(user.job)
            }
            UserIDCard(user: user)
            UserID2()
            ActiveIndicator(isActive: $user.isFrench)
            Toggle("Is French", isOn: $user.isFrench)
            TextField("Change username", text: $user.name)
            Button("Acidify") {
                user.acidify()
            }
            Text("\(user.acidity)")
            List(user.scores, id:\.self) { score in
                Text("\(score)")
            }
        }
        .environmentObject(user)
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
