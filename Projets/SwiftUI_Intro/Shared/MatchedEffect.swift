//
//  MatchedEffect.swift
//  SwiftUI_Intro
//
//  Created by Ludovic Ollagnier on 10/06/2021.
//

import SwiftUI

struct MatchedEffect: View {
    
    @State private var isCircle = true
    @Namespace var animation
    
    var body: some View {
        VStack {
            if isCircle {
                Spacer()
                Circle()
                    .foregroundColor(.green)
                    .frame(width: 200, height: 200)
                    .onTapGesture {
                        withAnimation {
                            isCircle = false
                        }
                    }
                    .matchedGeometryEffect(id: "toto", in: animation)
            } else {
                Rectangle()
                    .foregroundColor(.red)
                    .frame(width: 200, height: 200)
                    .onTapGesture {
                        withAnimation {
                            isCircle = true
                        }
                    }
                    .matchedGeometryEffect(id: "toto", in: animation)
                Spacer()
            }
        }
    }
}

struct MatchedEffect_Previews: PreviewProvider {
    static var previews: some View {
        MatchedEffect()
    }
}
