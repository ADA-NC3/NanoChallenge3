//
//  TicketsView.swift
//  NanoChallenge3 Watch App
//
//  Created by Muhammad Naufal Nabiel on 18/07/23.
//

import SwiftUI

struct TicketsView: View {
    var tickets = ["A", "B"]
    var body: some View {
        NavigationView{
            if tickets.isEmpty {
                    VStack{
                        Spacer()
                        Text("You haven't purchased any ticket yet. Please purchase your ticket on the MRT-J phone app.").multilineTextAlignment(.center)
                        Spacer()
                }.navigationTitle("Tickets")
            }else{
                TicketList()
            }
        }
        
    }
}

struct TicketsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
                TicketsView()
            }
        .navigationTitle("Tickets").tint(.blue)
                
    }
}
