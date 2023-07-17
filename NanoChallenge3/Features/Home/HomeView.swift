//
//  HomeView.swift
//  NanoChallenge3
//
//  Created by Alfine on 17/07/23.
//

import SwiftUI

struct HomeView: View {
    enum TicketPayment: String, CaseIterable, Identifiable {
        case mrtPay, oneWay, roundTrip
        var id: Self { self }
    }
    
//    enum MrtStation: String, CaseIterable, Identifiable {
//        case    LebakBulus = "Lebak Bulus Grab",
//                BlokM = "Blok M",
//                DukuAtas = "Duku Atas",
//                BundaranHI = "Bundaran HI"
//        var id: Self { self }
//    }

    @State private var selectedTicketPayment: TicketPayment = .mrtPay
//    @State private var selectedDepartureStation: MrtStation = .LebakBulus
//    @State private var selectedDestinationStation: MrtStation = .BlokM
    
    var body: some View {
        ZStack{
            Color(.white)
            VStack{
                HStack{
                    VStack(alignment: .leading){
                        //TODO: SET UP GREETINGS AND USER NAME
                        Text("Good \("Morning"), \("Nabiel")!")
                            .font(.title2)
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .padding(.bottom, -5)
                        Text("Lets find joy in every day with MRTJ.")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .fontWeight(.regular)
                        HStack{
                            Image("Location")
                                .padding(.trailing, -5)
                            //TODO: SET UP NEAREST STATION
                            Text("Nearest Station **\("Blok M")**")
                                .font(.footnote)
                                .foregroundColor(.white)
                        }
                        .padding(.top, 4)
                    }
                    Spacer()
                }
                .padding(.top, 80)
                .padding(.bottom, 160)
                .padding(.horizontal, 25)
                .background(Color(UIColor.blue_base))
                .roundedCorner(40, corners: [.bottomLeft, .bottomRight])
                
                VStack{
                    Picker("Ticket Payment", selection: $selectedTicketPayment) {
                        Text("MRTPay Beta")
                            .tag(TicketPayment.mrtPay)
                        Text("One Way").tag(TicketPayment.oneWay)
                        Text("Round Trip").tag(TicketPayment.roundTrip)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    .pickerStyle(.segmented)
                    
                    VStack{
                        if selectedTicketPayment == TicketPayment.mrtPay {
                            MRTPayView()
                        } else if selectedTicketPayment == TicketPayment.oneWay{
                            OneWayView()
                        } else if selectedTicketPayment == TicketPayment.roundTrip{
                            RoundTripView()
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 20)
                }
                .background(.white)
                .overlay( /// apply a rounded border
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(UIColor.gray2_base), lineWidth: 1)
                )
                .cornerRadius(20)
                .padding(.top, -150)
                .padding(.horizontal, 25)
                Spacer()
            }
            
        }
        .ignoresSafeArea()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
