//
//  ContentView.swift
//  NanoChallenge3 Watch App
//
//  Created by Nyoman Adiwinanda on 14/07/23.
//

import SwiftUI

struct ContentView: View {
    var tickets: [String] = []
    @EnvironmentObject var router: Router
    var body: some View {
            if tickets.isEmpty {
                EmptyTicketView().environmentObject(router)
            }else{
                TicketList(times: tickets).environmentObject(router)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
//Placeholders
//"14.05", "14.12","14.13","14.14","14.15"
