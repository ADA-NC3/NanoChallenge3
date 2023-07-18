//
//  TicketList.swift
//  NanoChallenge3 Watch App
//
//  Created by Muhammad Naufal Nabiel on 18/07/23.
//

import SwiftUI

struct TicketList: View {
    var times = ["14.05", "14.12","14.13","14.14","14.15"]
    var body: some View {
        List{
            ForEach(times.prefix(4),  id: \.self){ ticket in NavigationLink{
                QRView()
            } label: {
                TicketRow(arrival: ticket)
            }
                
            }.navigationTitle("Tickets")
        }
    }
}

struct TicketList_Previews: PreviewProvider {
    static var previews: some View {
        TicketList()
    }
}
