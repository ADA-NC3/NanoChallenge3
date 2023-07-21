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
    @Published var isPurchased: Bool = false
    @Published var sheetDetailTicket: Bool = false
    
    @Published var activeTickets: [MyTicketModel] = [
        MyTicketModel(departure: "Cipete Raya", destination: "Sisingamangarajan", date: "18/7/2023 03.00 am"),
        MyTicketModel(departure: "Blok A", destination: "Blok M", date: "18/7/2023 03.00 am")
    ]
    
    @Published var historyTicket = MyTicketModel(departure: "Cipete Raya", destination: "Sisingamangarajan", date: "18/7/2023 03.00 am")
    
    var tickets: [MyTicketModel] {
        return selectedPicker == 0 ? activeTickets : [historyTicket]
    }
}
