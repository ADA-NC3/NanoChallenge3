//
//  QRView.swift
//  NanoChallenge3
//
//  Created by Muhammad Naufal Nabiel on 18/07/23.
//

import SwiftUI

struct QRView: View {
    var qrCode = ["QR_IN", "QR_OUT"]
    var body: some View {
        NavigationView{
            ScrollView{
                if true {
                    VStack {
                        Text("Scan In QR").font(.title3).fontWeight(.medium)
                        Image("\(qrCode[0])").resizable().frame(width:120, height: 120)
                        Text("Enter Blok M Station").padding(.top)
                        
                    }
                }else{
                    
                }
            }
        }
    }
}

struct QRView_Previews: PreviewProvider {
    static var previews: some View {
        QRView()
    }
}
