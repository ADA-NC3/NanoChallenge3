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
        

        TicketListHeader().listRowBackground(Color.clear).scenePadding()
        ForEach(times.prefix(4), id: \.self) { ticket in
            NavigationLink(destination: QRView()) {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(.blue)
                        .opacity(0.3)
                    
                    TicketRow(arrival: ticket)
                        .padding()
                }
            }
            .buttonStyle(PlainButtonStyle())
        }
        
    }
}

struct TicketListHeader: View {
    var body: some View {
        HStack {
            Text("Trips")
                .font(.headline)
                .fontWeight(.medium)
            Spacer()
        }
        
    }
}

struct TicketList_Previews: PreviewProvider {
    static var previews: some View {
        TicketListView(times: ["14.05", "14.12","14.13","14.14","14.15"])
    }
}
