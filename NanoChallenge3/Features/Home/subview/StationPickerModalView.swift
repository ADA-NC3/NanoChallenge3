//
//  StationPickerModalView.swift
//  NanoChallenge3
//
//  Created by Alfine on 18/07/23.
//

import SwiftUI

struct StationPickerModalView: View {
    
    @State var searchStation = ""
    @StateObject var vm = HomeViewModel()
    var stationType: String
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.searchStationFilter(searchText: searchStation), id: \.name) { station in
                    Text(station.name)
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                        .onTapGesture {
                            //TODO: MASIH BELOM KE GANTI OPTIONNYA DI HALAMAN HOME
                            if stationType == "Departure"{
                                vm.selectedDepartureStation = station
                                print("a")
                            }else if stationType == "Destination"{
                                vm.selectedDestinationStation = station
                                print("b")
                            }else {
                                print("ERROR: UNRECOGNIZED STATION_TYPE")
                            }
                        }
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
}

struct StationPickerModalView_Previews: PreviewProvider {
    static var previews: some View {
        StationPickerModalView(stationType: "Departure")
    }
}
