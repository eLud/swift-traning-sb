//
//  TrackView.swift
//  Fractione (iOS)
//
//  Created by Ludovic Ollagnier on 23/06/2021.
//

import SwiftUI
import CoreLocation
import MapKit

struct TrackView: View {

    let track: [CLLocation]

    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.88, longitude: 2.31), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))

    var body: some View {
        OverlayedMapView(overlays: [polyline()])
    }

    func polyline() -> MKPolyline {
        let coordinates = track.map { location in
            return location.coordinate
        }
        let simplified = coordinates.simplify(tolerance: 0.0001, highestQuality: true)
        let polyline = MKPolyline(coordinates: simplified, count: simplified.count)
        return polyline
    }
}

struct TrackView_Previews: PreviewProvider {
    static var previews: some View {
        TrackView(track: [])
    }
}
