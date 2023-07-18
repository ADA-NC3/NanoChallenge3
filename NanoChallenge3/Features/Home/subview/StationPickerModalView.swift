//
//  StationPickerModalView.swift
//  NanoChallenge3
//
//  Created by Alfine on 18/07/23.
//

import SwiftUI

struct StationPickerModalView: View {
    
    @State var searchStation = ""
    @StateObject var mrtStation = MRTStation()
    var stationType: String
    
    var body: some View {
        NavigationView {
            List {
                ForEach(stationSearchResult) { station in
                    Text(station.rawValue)
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                        .onTapGesture {
                            //TODO: MASIH BELOM KE GANTI OPTIONNYA DI HALAMAN HOME
                            if stationType == "Departure"{
                                mrtStation.selectedDepartureStation = station
                                print("a")
                            }else if stationType == "Destination"{
                                mrtStation.selectedDestinationStation = station
                                print("b")
                            }else {
                                print("ERROR: UNRECOGNIZED STATION_TYPE")
                            }
                        }
//                                                Divider()
//                                                    .listRowInsets(EdgeInsets())
                }
                
            }
            .searchable(text: $searchStation)
            .listStyle(.plain)
            .toolbar {
                Button {
                    
                } label: {
                    Text("Cancel")
                        .foregroundColor(Color(UIColor.blue_base))
                }

            }
            .navigationTitle("\(stationType) Station")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        .presentationDragIndicator(.visible)
    }
    
    var stationSearchResult: [MRTStation.MrtStation]{
        if searchStation.isEmpty {
            return mrtStation.stationArray
        }
        else {
            var filteredStation: [MRTStation.MrtStation] = []
            for station in mrtStation.stationArray {
                if (station.rawValue.range(of: searchStation, options: .caseInsensitive) != nil){
                    filteredStation.append(station)
                }
            }
            return filteredStation

        }
    }
}

struct StationPickerModalView_Previews: PreviewProvider {
    static var previews: some View {
        StationPickerModalView(stationType: "Departure")
    }
}
