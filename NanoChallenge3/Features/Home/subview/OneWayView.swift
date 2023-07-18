//
//  OneWayView.swift
//  NanoChallenge3
//
//  Created by Alfine on 17/07/23.
//

import SwiftUI

struct OneWayView: View {
    
    @StateObject var mrtStation = MRTStation()
    @State var departureStationSheet = false
    @State var destinationStationSheet = false
//    @State var searchStation = ""
//    @State var departureStation = "false"
    
    var body: some View {
        VStack(alignment: .leading){
            ZStack(alignment: .trailing){
                VStack{
                    VStack(alignment: .leading){
                        Text("From")
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .foregroundColor(Color(UIColor.gray_base))
                            .padding(.bottom, 3)
                        
                        HStack{
                            Image("Train1")
                            Text("\(mrtStation.selectedDepartureStation.rawValue)")
                                .font(.body)
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .onTapGesture {
                            departureStationSheet = true
                        }
                        .sheet(isPresented: $departureStationSheet) {
                            StationPickerModalView(stationType: "Departure")
                        }
                        Divider()
                            .overlay(Color(uiColor: .gray2_base))
                            .padding(.top, -5)
                    }
                    VStack(alignment: .leading){
                        Text("To")
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .foregroundColor(Color(UIColor.gray_base))
                            .padding(.bottom, 3)
                        
                        HStack{
                            Image("Train2")
                            Text("\(mrtStation.selectedDestinationStation.rawValue)")
                                .font(.body)
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .onTapGesture {
                            destinationStationSheet = true
                        }
                        .sheet(isPresented: $destinationStationSheet) {
                            StationPickerModalView(stationType: "Destination")
                        }
                        Divider()
                            .overlay(Color(uiColor: .gray2_base))
                            .padding(.top, -5)
                    }
                }
                Image(systemName: "arrow.up.arrow.down")
                    .padding(.top, 16)
                    .foregroundColor(Color(uiColor: .blue_base))
                    .onTapGesture {
                        mrtStation.switchStation()
                    }
            }
            
            HStack{
                Text("Price")
                    .font(.subheadline)
                    .foregroundColor(Color(UIColor.gray_base))
                Spacer()
                Text("Rp. \("8.000")")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
            }
            .padding(.top, 22)
            
            Button{
                //TODO: PURCHASE BUTTON LOGIC
                
            } label: {
                Spacer()
                Text("Purchased Ticket")
                    .font(.body)
                    .foregroundColor(.white)
                Spacer()
            }
            .frame(height: 46)
            .background(Color(UIColor.blue_base))
            .cornerRadius(12)
        }
    }
}

struct OneWayView_Previews: PreviewProvider {
    static var previews: some View {
        OneWayView()
    }
}
