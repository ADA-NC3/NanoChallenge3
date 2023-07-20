//
//  ScanMRTPayView.swift
//  NanoChallenge3 Watch App
//
//  Created by Muhammad Naufal Nabiel on 20/07/23.
//

import SwiftUI

struct ScanMRTPayView: View {
    
    var body: some View {
        NavigationView{
            ScrollView{
                if true {
                    VStack {
                        Text("Scan MRTPay").font(.title3).fontWeight(.semibold)
                        Image("QR_IN").resizable().frame(width:120, height: 120)
                        
                        
                    }
                }else{
                    
                }
            }
        }
    }
}

struct ScanMRTPayView_Previews: PreviewProvider {
    static var previews: some View {
        ScanMRTPayView()
    }
}
