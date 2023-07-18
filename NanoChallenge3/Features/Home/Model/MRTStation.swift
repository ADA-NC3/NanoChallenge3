//
//  MRTStation.swift
//  NanoChallenge3
//
//  Created by Alfine on 18/07/23.
//

import Foundation

final class MRTStation: ObservableObject {
    
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
}
