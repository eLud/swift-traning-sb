//
//  UserData.swift
//  SwiftUI_Intro
//
//  Created by Ludovic Ollagnier on 08/06/2021.
//

import Foundation

class UserData: ObservableObject {

    @Published var name = "Ludovic"
    @Published var job = "iOS Dev"
    @Published var age = 34
    @Published var isFrench = true

    var scores: [Int] = []

    func addScore() {
        objectWillChange.send()
        scores.append(Int.random(in: 0...50))
    }
}
