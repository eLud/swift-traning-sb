//
//  LocationDataManager.swift
//  Fractione
//
//  Created by Ludovic Ollagnier on 22/06/2021.
//

import Foundation
import CoreLocation
import SwiftUI

class LocationDataManager: NSObject, ObservableObject {

    @Published var currentLocation: CLLocation?
    var track: [CLLocation]

    private var locationManager: CLLocationManager

    override init() {
        locationManager = CLLocationManager()
        track = []
        super.init()

//        if let savedTrack = UserDefaults.standard.object(forKey: "trackHistory") as? [CLLocation] {
//            self.track = savedTrack
//        }

        guard CLLocationManager.locationServicesEnabled() else { return }
        locationManager.delegate = self

        //configure locationManager
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 1

        //handle authorization
        authorize()
    }

    func startLocationUpdates() {
        locationManager.startUpdatingLocation()
    }

    func stopLocationUpdates() {
        locationManager.stopUpdatingLocation()
    }

    private func authorize() {
        switch locationManager.authorizationStatus {
        case .notDetermined:
            break
        case .restricted, .denied:
            return
        case .authorizedAlways, .authorizedWhenInUse:
            return
        @unknown default:
            break
        }
        locationManager.requestWhenInUseAuthorization()
    }
}

extension LocationDataManager: CLLocationManagerDelegate {

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse || manager.authorizationStatus == .authorizedAlways {
            startLocationUpdates()
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastLocation = locations.last {
            self.currentLocation = lastLocation
            self.track.append(lastLocation)

//            UserDefaults.standard.set(track, forKey: "trackHistory")
        }
    }
}
