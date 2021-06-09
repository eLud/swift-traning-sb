//
//  ActiveIndicator.swift
//  SwiftUI_Intro
//
//  Created by Ludovic Ollagnier on 08/06/2021.
//

import SwiftUI

struct ActiveIndicator: View {

    // La vérité est ailleurs
    @Binding var isActive: Bool

    var body: some View {
        Button(action: {
            withAnimation(.easeInOut(duration: 0.2)) {
                isActive.toggle()
            }
        }, label: {
            ZStack {
                Capsule()
                    .foregroundColor(isActive ? .green : Color(.lightGray))
                HStack(spacing: 0) {
                    if isActive {
                        Spacer()
                    }
                    Circle()
                        .frame(width: 28, height: 28)
                        .padding(2)
                        .foregroundColor(.white)
                        .shadow(radius: 3)
                    if !isActive {
                        Spacer()
                    }
                }
            }
        })
        .buttonStyle(PlainButtonStyle())
        .frame(width: 60, height: 30)
    }
}

struct ActiveIndicator_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ActiveIndicator(isActive: .constant(true))
                .previewLayout(.sizeThatFits)
            ActiveIndicator(isActive: .constant(false))
                .previewLayout(.sizeThatFits)
        }
    }
}
