//
//  EmptyTicketView.swift
//  NanoChallenge3 Watch App
//
//  Created by Muhammad Naufal Nabiel on 19/07/23.
//

import SwiftUI

struct EmptyTicketView: View {

    @EnvironmentObject var router: Router
    
    //Debugging Router
    @State var path: [Int] = []
    @State var count: Int = 0
    
    //Placeholders
    //"14.05", "14.12","14.13","14.14","14.15"
    //Bisa diganti ke list of tickets yg udh kebeli
    @State var tickets: [String] = ["14.25", "14.30", "14.35"]
    
    var body: some View {
        NavigationStack(path: $router.path){
            ScrollView{
                HStack{
                    Text("Tickets")
                        .font(.system(size: 25))
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading).colorMultiply(Color(red: 174 / 255, green: 191 / 255, blue: 215 / 255))
                    
                    Spacer()
                }.scenePadding(.horizontal).padding(.bottom)
                
                HStack {
                    Text("MRT Pay")
                        .font(.headline)
                        .fontWeight(.medium)
                    Spacer()
                }.scenePadding(.horizontal)
                
                
                Button(action: {
                    router.path.append(1)
                }) {
                    Text("Show QR").fontWeight(.medium)
                }
                .navigationDestination(for: Int.self){ destination in
                    switch destination {
                    case 1:
                        PasswordView().environmentObject(router)
                    case 2:
                        ScanSuccessView(isMRTPay: true).environmentObject(router)
                    case 3:
                        ScanMRTPayView().environmentObject(router)
                    case 4:
                        QRView().environmentObject(router)
                    case 5:
                        ScanSuccessView(isMRTPay: false).environmentObject(router)
                    default:
                        EmptyView()
                    }
                }.buttonStyle(BorderedButtonStyle()).clipShape(Capsule()).padding(.bottom)
                
                if tickets.isEmpty{
                    VStack(alignment: .leading) {
                        Text("Trips")
                            .font(.caption)
                            .fontWeight(.medium)
                        
                        Text("You haven’t purchased any ticket yet. Please purchase your ticket first.")
                            .multilineTextAlignment(.leading)
                            .colorMultiply(Color(.gray))
                            .font(.system(size: 12))
                    }.padding(.top).scenePadding(.horizontal)
                }else{
                    TicketListView(times: tickets)
                }
                
            }
        }
    }
}


struct EmptyTicketView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyTicketView().environmentObject(Router())
    }
}
