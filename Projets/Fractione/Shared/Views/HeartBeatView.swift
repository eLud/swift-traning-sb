//
//  HeartBeatView.swift
//  Fractione
//
//  Created by Ludovic Ollagnier on 21/06/2021.
//

import SwiftUI

struct HeartBeatView: View {

    var heartRate: Int
    @State private var bigHeart = false
    @State var sideBySide: Bool

    @EnvironmentObject var healthManager: HealtKitDataManager

    var body: some View {
        ZStack {
            Image(systemName: "heart.fill")
                .foregroundColor(.red)
                .font(.system(size: sideBySide ? 20 : 50))
                .scaleEffect(bigHeart ? 1 : 0.8 )
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
                        startBeating()
                    }
                }

            Text("\(healthManager.heartRate)")
                .font(.system(.caption))
                .foregroundColor(sideBySide ? .red : .black)
                .alignmentGuide(HorizontalAlignment.center) { d in
                    sideBySide ? d[.leading] - 15 : d[HorizontalAlignment.center]
                }
        }
    }

    func startBeating() {
        withAnimation(beatingAnimation) {
            bigHeart = true
        }
    }

    var beatingAnimation: Animation {
        let duration = 30.0 / Double(healthManager.heartRate)
        let baseAnimation = Animation.easeOut(duration: duration)
        let repeated = baseAnimation.repeatForever(autoreverses: true)
        return repeated
    }
}

struct HeartBeatView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
//            HeartBeatView(heartRate: 200, sideBySide: true)
            HeartBeatView(heartRate: 160, sideBySide: false)
        }
    }
}
