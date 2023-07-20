//
//  LocationManager.swift
//  NanoChallenge3
//
//  Created by Falah Hasbi Assidiqi on 17/07/23.
//

import MapKit
import SwiftUI

final class LocationManager: NSObject, ObservableObject {
    
    @Published var location: CLLocation?
    
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        configureLocationManager()
        startUpdatingLocation()
    }
    
    private func configureLocationManager() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
    }
    
    private func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        DispatchQueue.main.async {
            self.location = location
        }
    }
}
