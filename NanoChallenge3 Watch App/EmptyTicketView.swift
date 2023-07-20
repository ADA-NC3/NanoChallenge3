//
//  EmptyTicketView.swift
//  NanoChallenge3 Watch App
//
//  Created by Muhammad Naufal Nabiel on 19/07/23.
//

import SwiftUI

struct EmptyTicketView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack{
                    HStack{
                        Text("Tickets")
                            .font(.system(size: 25))
                            .fontWeight(.medium)
                            .multilineTextAlignment(.leading).colorMultiply(Color(red: 10 / 255, green: 132 / 255, blue: 255 / 255))
                        
                        Spacer()
                    }.scenePadding(.horizontal)
                    
                 
                       
                    NavigationLink(destination: ScanMRTPayView()) {
                            Text("MRT Pay")
                    }.buttonStyle(BorderedButtonStyle(tint: Color.green.opacity(2))).padding(.bottom)
                        
                    

                    VStack(alignment: .leading) {
                        Text("Trips")
                            .font(.title3)
                            .fontWeight(.medium)
                        Text("You haven’t purchased any ticket yet. Please purchase your ticket first.")
                            .multilineTextAlignment(.leading)
                            .colorMultiply(Color(.gray))
                            .font(.system(size: 12))
                    }
                }
            }
        }.navigationTitle{
            Text("Tickets")
                .bold()
                .colorMultiply(Color(red: 0 / 255, green: 122 / 255, blue: 255 / 255))
                .offset(x: -30)
        }
    }
}

struct EmptyTicketView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyTicketView()
    }
}
