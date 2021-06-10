//
//  Color+Extensions.swift
//  Fidelity
//
//  Created by Ludovic Ollagnier on 10/06/2021.
//

import SwiftUI

extension Color {
    static var random: Color {
        let red = Double.random(in: 0.0...1.0)
        let green = Double.random(in: 0.0...1.0)
        let blue = Double.random(in: 0.0...1.0)
        return Color(red: red, green: green, blue: blue, opacity: 1)
    }
}
