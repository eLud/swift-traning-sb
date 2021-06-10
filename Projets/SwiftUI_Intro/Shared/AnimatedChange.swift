//
//  AnimatedChange.swift
//  SwiftUI_Intro
//
//  Created by Ludovic Ollagnier on 10/06/2021.
//

import SwiftUI

struct AnimatedChange: View {
    
    @State private var atTop = false
    
    var body: some View {
        VStack {
            if !atTop {
                Spacer()
            }
            Rectangle()
                .foregroundColor(atTop ? .green : .red)
                .frame(width: 200, height: 200)
                .cornerRadius(atTop ? 100 : 0)
                .overlay(atTop ? Text("Circle") : Text("Rectangle"))
                .onTapGesture {
                    withAnimation {
                        atTop.toggle()
                    }
                }
            if atTop {
                Spacer()
            }

        }
    }
}

struct AnimatedChange_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedChange()
    }
}
