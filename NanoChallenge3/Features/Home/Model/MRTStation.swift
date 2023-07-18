//
//  MRTStation.swift
//  NanoChallenge3
//
//  Created by Alfine on 18/07/23.
//

import Foundation

final class MRTStation: ObservableObject {
    let stationArray: [MrtStation] = [.LebakBulus, .Fatmawati, .CipeteRaya, .HajiNawi, .BlokA, .BlokM, .ASEAN, .Senayan, .Istora, .BendunganHilir, .SetiaBudi, .DukuhAtas, .BundaranHI]
    @Published var selectedDepartureStation = MrtStation.LebakBulus
    @Published var selectedDestinationStation = MrtStation.BundaranHI
    
    enum MrtStation: String, CaseIterable, Identifiable {
        case    LebakBulus = "Lebak Bulus Grab",
                Fatmawati = "Fatmawati Indomaret",
                CipeteRaya = "Cipete Raya",
                HajiNawi = "Haji Nawi",
                BlokA = "Blok A",
                BlokM = "Blok M BCA",
                ASEAN = "ASEAN",
                Senayan = "Senayan",
                Istora = "Istora Mandiri",
                BendunganHilir = "Bendungan Hilir",
                SetiaBudi = "Setia Budi Astra",
                DukuhAtas = "Dukuh Atas BNI",
                BundaranHI = "Bundaran HI"
        var id: Self { self }
    }
    
    func switchStation(){
        let temp = selectedDepartureStation
        selectedDepartureStation = selectedDestinationStation
        selectedDestinationStation = temp
    }
    
//    func setDepartureStation(station: MrtStation){
//        selectedDepartureStation = station
//    }
//    func setDestinationStation(station: MrtStation){
//        selectedDestinationStation = station
//    }
}
