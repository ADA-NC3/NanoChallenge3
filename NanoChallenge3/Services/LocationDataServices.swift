//
//  LocationDataServices.swift
//  NanoChallenge3
//
//  Created by Falah Hasbi Assidiqi on 18/07/23.
//

import Foundation
import MapKit

class LocationDataServices {
    
    static let locations: [StationModel] = [
        StationModel(
            name: "Lebak Bulus",
            coordinate: CLLocationCoordinate2D(latitude: -6.288984515509537, longitude: 106.77526536647976)
        ),
        StationModel(
            name: "Fatmawati Indomaret",
            coordinate: CLLocationCoordinate2D(latitude: -6.292226045433551, longitude: 106.79247072415215)
        ),
        StationModel(
            name: "Cipete Raya",
            coordinate: CLLocationCoordinate2D(latitude: -6.278019310351537, longitude: 106.79730053764328)
        ),
        StationModel(
            name: "Haji Nawi",
            coordinate: CLLocationCoordinate2D(latitude: -6.266478663837953, longitude: 106.79732196647947)
        ),
        StationModel(
            name: "Blok A",
            coordinate: CLLocationCoordinate2D(latitude: -6.2545673592283695, longitude: 106.79718145298801)
        ),
        StationModel(
            name: "Blok M BCA",
            coordinate: CLLocationCoordinate2D(latitude: -6.244278020433374, longitude: 106.7981429106603)
        ),
        StationModel(
            name: "ASEAN",
            coordinate: CLLocationCoordinate2D(latitude: -6.238513151910217, longitude: 106.79863726066031)
        ),
        StationModel(
            name: "Senayan",
            coordinate: CLLocationCoordinate2D(latitude: -6.2265059517807, longitude: 106.80256322600508)
        ),
        StationModel(
            name: "Istora Mandiri",
            coordinate: CLLocationCoordinate2D(latitude: -6.222105318560093, longitude: 106.80853505113394)
        ),
        StationModel(
            name: "Bendungan Hilir",
            coordinate: CLLocationCoordinate2D(latitude: -6.2147546807677205, longitude: 106.817949995315)
        ),
        StationModel(
            name: "Setiabudi Astra",
            coordinate: CLLocationCoordinate2D(latitude: -6.208501152912148, longitude: 106.82148456647862)
        ),
        StationModel(
            name: "Dukuh Atas BNI",
            coordinate: CLLocationCoordinate2D(latitude: -6.200530542024193, longitude: 106.82283901065976)
        ),
        StationModel(
            name: "Bundaran HI",
            coordinate: CLLocationCoordinate2D(latitude: -6.191582638771158, longitude: 106.82296612415088)
        )
    ]
}
