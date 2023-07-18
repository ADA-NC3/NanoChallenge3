//
//  HomeViewModel.swift
//  NanoChallenge3
//
//  Created by Alfine on 18/07/23.
//

import Foundation
import SwiftUI
import MapKit

class HomeViewModel: ObservableObject {
    
    @Published var selectedDepartureStation: StationModel?
    @Published var selectedDestinationStation: StationModel?
    
    @Published var locations: [StationModel]
    
    init() {
        let locations = LocationDataServices.locations
        self.locations = locations
    }
    
    func findNearestStation(userLocation: CLLocationCoordinate2D) -> StationModel? {
        var nearestStation: StationModel? = nil
        var shortDistance: CLLocationDistance = Double.greatestFiniteMagnitude
        
        for location in locations {
            let stationLocation = CLLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let distance = stationLocation.distance(from: CLLocation(latitude: userLocation.latitude, longitude: userLocation.longitude))
            if distance < shortDistance {
                shortDistance = distance
                nearestStation = location
            }
        }
        
        return nearestStation
    }
    
    func switchStation(){
        let temp = selectedDepartureStation
        selectedDepartureStation = selectedDestinationStation
        selectedDestinationStation = temp
    }
    
    func searchStationFilter(searchText: String) -> [StationModel]{
        if searchText.isEmpty {
            return locations
        } else {
            var filteredStation: [StationModel] = []
            for station in locations {
                if (station.name.range(of: searchText, options: .caseInsensitive) != nil){
                    filteredStation.append(station)
                }
            }
            return filteredStation

        }
    }
    
    func generateGreeting() -> String{
        var greetings: String
        let hour = Calendar.current.component(.hour, from: Date())
        if hour >= 4 && hour < 12 {
            greetings = "Morning"
        }else if hour >= 12 && hour < 18 {
            greetings = "Afternoon"
        }else {
            greetings = "Evening"
        }
        return greetings
    }
}
