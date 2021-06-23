//
//  ControlsView.swift
//  FracWatch WatchKit Extension
//
//  Created by Ludovic Ollagnier on 22/06/2021.
//

import SwiftUI

struct ControlsView: View {

    @Binding var tabSelection: Int
    @State private var workoutStarted = true

    @EnvironmentObject var healthManager: HealtKitDataManager
    @EnvironmentObject var locationManager: LocationDataManager
    @EnvironmentObject var sessionManager: SessionDataManager

    var body: some View {
        VStack {
            if workoutStarted {
                Button("Stop") {
                    healthManager.stopHeartRateUpdate()
                    locationManager.stopLocationUpdates()
                    workoutStarted = false

                    sessionManager.sendData()
                }
            } else {
                Button("Start") {
                    healthManager.startHeartRateUpdate()
                    locationManager.startLocationUpdates()
                    workoutStarted = true

                    showActivityTab()
                }
            }
        }
    }

    private func showActivityTab() {
        withAnimation {
            self.tabSelection = 1
        }
    }

    private func playHapticStart() {
        #if os(watchOS)
        WKInterfaceDevice.current().play(.start)
        #elseif os(iOS)
        UINotificationFeedbackGenerator().notificationOccurred(.success)
        #endif
    }

    private func playHapticStop() {
        #if os(watchOS)
        WKInterfaceDevice.current().play(.stop)
        #elseif os(iOS)
        UINotificationFeedbackGenerator().notificationOccurred(.error)
        #endif
    }
}

struct ControlsView_Previews: PreviewProvider {
    static var previews: some View {
        ControlsView(tabSelection: .constant(1))
    }
}
