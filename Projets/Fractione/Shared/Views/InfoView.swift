//
//  InfoView.swift
//  Fractione
//
//  Created by Ludovic Ollagnier on 21/06/2021.
//

import SwiftUI

struct InfoView: View {

    let heartRate: Int
    let currentIntervalTime: TimeInterval
    let ascent: Int

    @State private var heartScale = 1.0

    var body: some View {
        HStack(alignment: .bottom) {
            Spacer()
            HeartBeatView(heartRate: heartRate, sideBySide: true)
            HStack {
                Image(systemName: "stopwatch.fill")
                Text("\(Int(currentIntervalTime))")
            }
            .font(.caption)
            HStack {
                Image(systemName: "line.diagonal.arrow")
                Text("\(ascent)")
            }
            .font(.caption)
            Spacer()
        }
        .background(Rectangle()
                        .foregroundColor(.black))
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(heartRate: 145,
                 currentIntervalTime: 160,
                 ascent: 200)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 300, height: 44))
    }
}
