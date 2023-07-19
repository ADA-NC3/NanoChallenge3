//
//  MyTicketModel.swift
//  NanoChallenge3
//
//  Created by Falah Hasbi Assidiqi on 19/07/23.
//

import Foundation

struct MyTicketModel: Identifiable {
    let id = UUID()
    let departure: String
    let destination: String
    let date: String // sementara pake string dulu untuk data static
}
