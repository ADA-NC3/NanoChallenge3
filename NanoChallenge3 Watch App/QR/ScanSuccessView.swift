//
//  ScanSuccessView.swift
//  NanoChallenge3 Watch App
//
//  Created by Muhammad Naufal Nabiel on 20/07/23.
//

import SwiftUI

struct ScanSuccessView: View {
    var isMRTPay = true
    var body: some View {
        VStack {
            Image(systemName: "checkmark.circle.fill")
                .resizable()
            .foregroundColor(.green).frame(width: 100, height: 100)
            Text("Payment Successful").font(.system(size:12)).foregroundColor(.gray).padding()
            if isMRTPay == true {
                Text("Balance: Rp 54.000").font(.system(size:15)).fontWeight(.regular)
            }
        }
    }
}

struct ScanSuccessView_Previews: PreviewProvider {
    static var previews: some View {
        ScanSuccessView()
    }
}
