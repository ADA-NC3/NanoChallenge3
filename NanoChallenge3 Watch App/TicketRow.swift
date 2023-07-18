//
//  TicketRow.swift
//  NanoChallenge3 Watch App
//
//  Created by Muhammad Naufal Nabiel on 18/07/23.
//

import SwiftUI

struct TicketRow: View {
    var arrival: String
    var body: some View {
        VStack(alignment: .leading){
            Text("Nearest Time")
            Text(arrival).font(.title).fontWeight(.black)
            Text("Blok M to Dukuh Atas").foregroundColor(.blue)
        }

           
            
            
    }
}

struct TicketRow_Previews: PreviewProvider {
    static var previews: some View {
        TicketRow(arrival: "14.12")
    }
}
