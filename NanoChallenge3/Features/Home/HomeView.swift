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

    @State private var selectedTicketPayment: TicketPayment = .mrtPay
    @StateObject private var vm = HomeViewModel()
    @StateObject private var locationManager = LocationManager()
    
    init() {
        //CUSTOMIZE PICKER THEME
        UISegmentedControl.appearance().backgroundColor = .gray2_base
        UISegmentedControl.appearance().setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.blue_base
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white_base], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.pickerTextColor], for: .normal)
    }
    
    var body: some View {
        ZStack{
            Color(.white)
            VStack{
                HStack{
                    VStack(alignment: .leading){
                        //TODO: SET UP GREETINGS AND USER NAME
                        Text("Good \(vm.generateGreeting()), \("Nabiel")!")
                            .font(.title2)
                            .foregroundColor(Color(uiColor: .white_base))
                            .fontWeight(.semibold)
                            .padding(.bottom, -5)
                        Text("Lets find joy in every day with MRTJ.")
                            .font(.subheadline)
                            .foregroundColor(Color(uiColor: .white_base))
                            .fontWeight(.regular)
                        HStack{
                            Image("Location")
                                .padding(.trailing, -5)
                            //TODO: SET UP NEAREST STATION
                            if let userLocation = locationManager.location?.coordinate,
                               let nearestLocation = vm.findNearestStation(userLocation: userLocation) {
                                Text("Nearest Station **\(nearestLocation.name)**")
                                    .font(.footnote)
                                    .foregroundColor(Color(red: 223/255, green: 223/255, blue: 223/255))
                            }
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
                        Text("MRTPay").tag(TicketPayment.mrtPay)
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
                            OneWayView(vm: vm)
                        } else if selectedTicketPayment == TicketPayment.roundTrip{
                            RoundTripView(vm: vm)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 20)
                }
                .background(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(UIColor.gray2_base), lineWidth: 1)
                )
                .cornerRadius(20)
                .padding(.top, -150)
                .padding(.horizontal, 25)
                
                VStack {
                    HStack{
                        Text("Nearest Arrival")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        Spacer()
                        Button{
                            
                        } label: {
                            Text("See More")
                                .foregroundColor(Color(uiColor: .blue_base))
                        }
                    }
                    HStack{
                        HStack{
                            Image("nearestArrivalDot")
                            VStack(alignment: .leading) {
                                Text("To Bundaran HI")
                                    .font(.subheadline)
                                    .foregroundColor(.black)
                                Text("09:47")
                                    .foregroundColor(Color(uiColor: .blue_base))
                                    .font(.title)
                                    .fontWeight(.bold)
                                Text("09:52")
                                    .font(.body)
                                    .foregroundColor(Color(uiColor: .gray_base))
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 20)
                        
                        HStack{
                            Image("nearestArrivalDot")
                            VStack(alignment: .leading) {
                                Text("To Lb. Bulus")
                                    .font(.subheadline)
                                    .foregroundColor(.black)
                                Text("09:45")
                                    .foregroundColor(Color(uiColor: .blue_base))
                                    .font(.title)
                                    .fontWeight(.bold)
                                Text("09:50")
                                    .font(.body)
                                    .foregroundColor(Color(uiColor: .gray_base))
                            }
                        }
                        .padding(.vertical, 20)
                        Spacer()
                    }
                    .background(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color(UIColor.gray2_base), lineWidth: 1)
                    )
                }
                .padding(.horizontal, 25)
                .padding(.vertical, 30)
                Spacer()
            }
            
        }
        .ignoresSafeArea()
        .preferredColorScheme(.dark)
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
