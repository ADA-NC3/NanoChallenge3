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

extension MKCoordinateRegion {
    
    static func defaultRegion() -> MKCoordinateRegion {
        let centerCoordinate = CLLocationCoordinate2D(latitude: -6.302265847748711, longitude: 106.65233924320476) // default sementara ambil lokasi GOP
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        return MKCoordinateRegion(center: centerCoordinate, span: span)
    }
    
    func getBinding() -> Binding<MKCoordinateRegion>? {
        return Binding<MKCoordinateRegion>(.constant(self))
    }
    
}
