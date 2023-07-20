//
//  MockPaymentModel.swift
//  NanoChallenge3
//
//  Created by Geraldy Kumara on 18/07/23.
//

import Foundation

// gakepake sih

struct MockPaymentModel: Identifiable, Hashable {
    let id = UUID()
    var image: String
    var isCheckWallet: Bool
}

extension MockPaymentModel{
    static let ewallet: [MockPaymentModel] = [
        MockPaymentModel(image: "astraPay", isCheckWallet: false),
        MockPaymentModel(image: "isaku", isCheckWallet: false)
    ]
    
    static let bank: MockPaymentModel = MockPaymentModel(image: "blu", isCheckWallet: false)
    
}
