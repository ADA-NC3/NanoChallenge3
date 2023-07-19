//
//  MyTicketViewModel.swift
//  NanoChallenge3
//
//  Created by Falah Hasbi Assidiqi on 19/07/23.
//

import Foundation
import SwiftUI

class MyTicketViewModel: ObservableObject {
    
    @Published var selectedPicker: Int = 0
    @Published var sheetDetailTicket: Bool = false
    
    @Published var activeTickets: [MyTicketModel] = [
        MyTicketModel(departure: "Lb. Bulus", destination: "Blok M", date: "17 July 2023"),
        MyTicketModel(departure: "Blok M", destination: "Lb. Bulus", date: "17 July 2023")
    ]
    
    @Published var historyTicket = MyTicketModel(departure: "Blok M", destination: "Lb. Bulus", date: "15 July 2023")
    
    var tickets: [MyTicketModel] {
        return selectedPicker == 0 ? activeTickets : [historyTicket]
    }
}
