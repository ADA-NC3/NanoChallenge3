//
//  Ticket.swift
//  NanoChallenge3
//
//  Created by Muhammad Naufal Nabiel on 18/07/23.
//

import Foundation

struct Ticket: Hashable, Codable, Identifiable {
    var id: Int
    var asal: String
    var tujuan: String
}
