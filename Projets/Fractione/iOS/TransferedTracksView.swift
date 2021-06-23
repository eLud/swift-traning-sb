//
//  TransferedTracksView.swift
//  Fractione (iOS)
//
//  Created by Ludovic Ollagnier on 23/06/2021.
//

import SwiftUI
import CoreLocation
import MapKit
import SwiftSimplify

struct TransferedTracksView: View {

    var body: some View {
        NavigationView {
            VStack {
                OverlayedMapView(overlays: polylines())
                    .frame(height: 300)
                List {
                    ForEach(0..<tracks.count) { i in
                        NavigationLink("Track \(i)", destination: TrackView(track: track(from: tracks[i])))
                    }
                }
            }
        }
    }

    var tracks: [Data] {
        let tracks = UserDefaults.standard.object(forKey: "tracks") as? [Data]
        return tracks ?? []
    }

    func track(from data: Data) -> [CLLocation] {
        if let track = try? NSKeyedUnarchiver.unarchivedArrayOfObjects(ofClass: CLLocation.self, from: data) {
            return track
        }
        return []
    }

    func polylines() -> [MKPolyline] {

        var polylines: [MKPolyline] = []

        for trackData in tracks {
            let locations = track(from: trackData)
            let coordinates = locations.map { location in
                return location.coordinate
            }
            print("Coordinates count \(coordinates.count)")
            let simplified = coordinates.simplify(tolerance: 0.0001, highestQuality: true)
            print("Simplified count \(simplified.count)")
            let polyline = MKPolyline(coordinates: simplified, count: simplified.count)
            polylines.append(polyline)
        }
        return polylines
    }
}

struct TransferedTracksView_Previews: PreviewProvider {
    static var previews: some View {
        TransferedTracksView()
    }
}
