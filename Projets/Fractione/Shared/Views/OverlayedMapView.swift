//
//  OverlayedMapView.swift
//  Fractione (iOS)
//
//  Created by Ludovic Ollagnier on 23/06/2021.
//

import SwiftUI
import MapKit

struct OverlayedMapView: UIViewRepresentable {

    var overlays: [MKOverlay]

    private let delegate = MapViewDelegate()

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = delegate
        mapView.addOverlays(overlays, level: .aboveLabels)
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {

    }

}

class MapViewDelegate: NSObject, MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let overlay = overlay as? MKPolyline {
            let renderer = MKPolylineRenderer(polyline: overlay)
            renderer.lineWidth = 5
            renderer.strokeColor = .red
            return renderer
        } else {
            return MKOverlayRenderer()
        }
    }
}
