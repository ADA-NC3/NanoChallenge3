//
//  EmptyTicketView.swift
//  NanoChallenge3 Watch App
//
//  Created by Muhammad Naufal Nabiel on 19/07/23.
//

import SwiftUI

struct EmptyTicketView: View {
    @EnvironmentObject var router: Router
    @State var path: [Int] = []
    @State var count: Int = 0
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
                        .font(.caption)
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
                        ScanSuccessView().environmentObject(router)
                    case 3:
                        ScanMRTPayView().environmentObject(router)
                    default:
                        EmptyView()
                    }
                }.buttonStyle(BorderedButtonStyle()).clipShape(Capsule())
                
                    VStack(alignment: .leading) {
                        Text("Trips")
                            .font(.caption)
                            .fontWeight(.medium)
                        
                        Text("You haven’t purchased any ticket yet. Please purchase your ticket first.")
                            .multilineTextAlignment(.leading)
                            .colorMultiply(Color(.gray))
                            .font(.system(size: 12))
                }.padding(.top).scenePadding(.horizontal)                
                
            }
            
        }
    }
}


struct EmptyTicketView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyTicketView().environmentObject(Router())
    }
}
