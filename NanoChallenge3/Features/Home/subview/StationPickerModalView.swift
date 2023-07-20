//
//  StationPickerModalView.swift
//  NanoChallenge3
//
//  Created by Alfine on 18/07/23.
//

import SwiftUI
import Speech

struct StationPickerModalView: View {
    
    @State var searchStation = ""
    @Binding var sheetOpenStatus: Bool
    @StateObject var mrtStation = MRTStation()
    @StateObject var vm: HomeViewModel
    var stationType: String
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.searchStationFilter(searchText: searchStation)) { station in
                    StationListView(station: station.rawValue)
                        .listRowSeparator(.hidden)
                        .listSectionSeparator(.hidden)
                        .listRowInsets(EdgeInsets())
                        .onTapGesture {
                            vm.pickStation(type: stationType, stationSelected: station)
                            sheetOpenStatus = false
                        }
                }   
            }
            .searchable(text: $searchStation, placement: .navigationBarDrawer(displayMode: .always))
            .listStyle(.plain)
            .toolbar {
                Button {
                    sheetOpenStatus = false
                } label: {
                    Text("Cancel")
                        .foregroundColor(Color(UIColor.blue_base))
                }

            }
            .navigationTitle("\(stationType) Station")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        .padding(.top, 10)
        .presentationDragIndicator(.visible)
    }
}

struct StationPickerModalView_Previews: PreviewProvider {
    static var previews: some View {
        StationPickerModalView(sheetOpenStatus: .constant(true), vm: HomeViewModel(), stationType: "Departure")
    }
}
