//
//  ContentView.swift
//  SimpleChrono WatchKit Extension
//
//  Created by Ludovic Ollagnier on 23/06/2021.
//

import SwiftUI

struct ContentView: View {

    @State private var startDate: Date?

    var body: some View {
        VStack {
            if let startDate = startDate {
                TimelineView(PeriodicTimelineSchedule(from: startDate, by: 1)) { context in
                    Text(context.date.timeIntervalSince(startDate).formatted())
                }
            }
            HStack {
                Button("Start") {
                    self.startDate = Date()
                }
                Button("Stop") {
                    self.startDate = nil
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
