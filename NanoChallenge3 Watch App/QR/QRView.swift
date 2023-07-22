//
//  QRView.swift
//  NanoChallenge3
//
//  Created by Muhammad Naufal Nabiel on 18/07/23.
//

import SwiftUI

struct QRView: View {
    //Bisa diganti ambil dari class ticket (?)
    var qrIn = ["QR_IN","In","Enter"]
    var qrOut = ["QR_OUT","Out","Exit"]
    var scanned = true
    
    @State private var features: Tab = .scanOut
    
    enum Tab {
            case scanIn, scanOut
        }
    
    var body: some View {
        VStack {
            TabView(selection: $features, content: {
                    if scanned == true{
                        ScanView(state: qrOut).tag(Tab.scanOut)
                    }
                    ScanView(state: qrIn).tag(Tab.scanIn)
                
            }).tabViewStyle(PageTabViewStyle())
        }
    }
}

struct ScanView: View {

    var state: [String]
    var body: some View{
        VStack {
            HStack {
                Spacer()
                Text("Scan \(state[1])")
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(.blue)
            }.scenePadding(.horizontal)
            
            Image("\(state[0])").resizable().frame(width:107.5, height: 107.5)
            
            Text("\(state[2]) Blok M Station")
                .font(.system(size:12))
                .foregroundColor(.gray)
                .padding(.top)
        }
    }
}

struct QRView_Previews: PreviewProvider {
    static var previews: some View {
        QRView()
    }
}
