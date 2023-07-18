//
//  QRView.swift
//  NanoChallenge3
//
//  Created by Muhammad Naufal Nabiel on 18/07/23.
//

import SwiftUI

struct QRView: View {
    var body: some View {
        VStack {
            Text("Scan In QR").font(.title3).fontWeight(.medium)
            Image("QR_IN").resizable().frame(width:120, height: 120)
            Text("Enter Blok M Station")
        }
    }
}

struct QRView_Previews: PreviewProvider {
    static var previews: some View {
        QRView()
    }
}
