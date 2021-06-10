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
    
    @Ph var acidity: Double = 7.0
    
    @Published var scores: [Int] = []

    func acidify() {
        objectWillChange.send()
        increaseAcidity(by: 17)
    }
    
    // Property wrapper in parameters : Swift 5.5
    func increaseAcidity(@Ph by increment: Double) {
        @Ph var toto = 6.9
        print(increment)
        acidity += increment
    }
}

@propertyWrapper
struct Ph {
    
    var value: Double
    
    init(wrappedValue: Double) {
        if wrappedValue < 0.0 {
            value = 0.0
        } else if wrappedValue > 14.0 {
            value = 14.0
        } else {
            value = wrappedValue
        }
    }
    
    var wrappedValue: Double {
        get {
            return value
        }
        
        set {
            if newValue < 0.0 {
                value = 0.0
            } else if newValue > 14.0 {
                value = 14.0
            } else {
                value = newValue
            }
        }
    }
}
