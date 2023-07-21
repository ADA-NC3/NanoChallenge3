//
//  TicketList.swift
//  NanoChallenge3 Watch App
//
//  Created by Muhammad Naufal Nabiel on 18/07/23.
//

import SwiftUI

struct TicketList: View {
    var times: [String]
    @EnvironmentObject var router: Router
    var body: some View {
        NavigationView {
            List {
                TicketListHeader().listRowBackground(Color.clear)
                
                ForEach(times.prefix(4), id: \.self) { ticket in
                    NavigationLink(destination: QRView()) {
                        TicketRow(arrival: ticket)
                    }
                }
            }.listStyle(DefaultListStyle())
        }
    }
}

struct TicketListHeader: View {
    var body: some View {
        HStack {
            Text("Trips")
                .font(.system(size: 25))
                .fontWeight(.medium)
                .foregroundColor(Color(red: 10 / 255, green: 132 / 255, blue: 255 / 255))
                .padding()
            
            Spacer()
        }
        
    }
}

struct TicketList_Previews: PreviewProvider {
    static var previews: some View {
        TicketList(times: ["14.05", "14.12","14.13","14.14","14.15"])
    }
}
