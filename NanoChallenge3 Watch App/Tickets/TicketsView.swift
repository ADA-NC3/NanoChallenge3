//
//  TicketsView.swift
//  NanoChallenge3 Watch App
//
//  Created by Muhammad Naufal Nabiel on 18/07/23.
//

import SwiftUI

struct TicketsView: View {
    var tickets: [String] = []
    var body: some View {
            if tickets.isEmpty {
                    EmptyTicketView()
            }else{
                TicketList(times: tickets)
            }
    }
}

struct TicketsView_Previews: PreviewProvider {
    static var previews: some View {
                TicketsView()
    }
}
//"14.05", "14.12","14.13","14.14","14.15"

