//
//  TicketList.swift
//  NanoChallenge3 Watch App
//
//  Created by Muhammad Naufal Nabiel on 18/07/23.
//

import SwiftUI

struct TicketListView: View {
    var times: [String]
    @EnvironmentObject var router: Router
    var body: some View {

            List {
                TicketListHeader().listRowBackground(Color.clear)
                
                ForEach(times.prefix(4), id: \.self) { ticket in
                    NavigationLink(destination: QRView()) {
                        TicketRow(arrival: ticket)
                    }.listRowBackground(RoundedRectangle(cornerRadius: 12)
                        .background(Color.clear)
                        .foregroundColor(.blue)
                        .opacity(0.3)
                    )
                }
            }
        
    }
}

struct TicketListHeader: View {
    var body: some View {
        HStack {
            Text("Trips")
                .font(.system(size: 25))
                .fontWeight(.medium)
                .foregroundColor(Color(red: 174 / 255, green: 191 / 255, blue: 215 / 255))
            Spacer()
        }
        
    }
}

struct TicketList_Previews: PreviewProvider {
    static var previews: some View {
        TicketListView(times: ["14.05", "14.12","14.13","14.14","14.15"])
    }
}
