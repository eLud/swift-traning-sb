//
//  UserID2.swift
//  SwiftUI_Intro
//
//  Created by Ludovic Ollagnier on 08/06/2021.
//

import SwiftUI

struct UserID2: View {

    // Comme @Binding pour les objets
    @EnvironmentObject var user: UserData

    var body: some View {
        VStack {
            Text(user.name)
            Text("\(user.age)")
            Text(user.job)
        }
        .padding()
        .background(Color.green)
        .cornerRadius(10)
    }
}

struct UserID2_Previews: PreviewProvider {
    static var previews: some View {
        UserID2()
    }
}
