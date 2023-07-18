//
//  HomeViewModel.swift
//  NanoChallenge3
//
//  Created by Alfine on 18/07/23.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    
    let stationArray: [MRTStation.MrtStation] = [.LebakBulus, .Fatmawati, .CipeteRaya, .HajiNawi, .BlokA, .BlokM, .ASEAN, .Senayan, .Istora, .BendunganHilir, .SetiaBudi, .DukuhAtas, .BundaranHI]
    @Published var selectedDepartureStation = MRTStation.MrtStation.Fatmawati
    @Published var selectedDestinationStation = MRTStation.MrtStation.BundaranHI
    
    func switchStation(){
        let temp = selectedDepartureStation
        selectedDepartureStation = selectedDestinationStation
        selectedDestinationStation = temp
    }
    
    func searchStationFilter(searchText: String) -> [MRTStation.MrtStation]{
        if searchText.isEmpty {
            return stationArray
        } else {
            var filteredStation: [MRTStation.MrtStation] = []
            for station in stationArray {
                if (station.rawValue.range(of: searchText, options: .caseInsensitive) != nil){
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
