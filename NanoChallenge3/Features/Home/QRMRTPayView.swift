//
//  QRMRTPayView.swift
//  NanoChallenge3
//
//  Created by Alfine on 20/07/23.
//

import SwiftUI

struct QRMRTPayView: View {
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var timeRemaining = 3 * 60
    @Binding var openQRPage: Bool
    @Binding var openPinPage: Bool
    

    var body: some View {
        NavigationView {
            VStack{
                Text("Please Scan In")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color(uiColor: .blue_base))
                Image("QRCode2")
                    .resizable()
                    .frame(width: 220, height: 220)
                    .background(.black)
                Text("Expired in \(timeRemaining / 60):\((timeRemaining % 60) < 10 ? "0\(timeRemaining % 60)" : String(timeRemaining % 60))")
                    .font(.callout)
                    .foregroundColor(.black)
                    .padding(.top, 10)
                    .onReceive(timer) { _ in
                        if timeRemaining > 0 {
                            timeRemaining -= 1
                        } else {
                            openPinPage = false
                            openQRPage = false
                        }
                    }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.white)
            .preferredColorScheme(.dark)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color(uiColor: .blue_base), for: .navigationBar)
            .navigationTitle("MRTPay QR")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                                    Button {
                                        openQRPage = false
                                        openPinPage = false
                                    } label: {
                                        HStack {
                                            Image(systemName: "chevron.backward")
                                                .foregroundColor(.white)
                                            Text("Back")
                                                .foregroundColor(.white)
                                        }
                                    }
                                }
            }
        }
    }
}

struct QRMRTPayView_Previews: PreviewProvider {
    static var previews: some View {
        QRMRTPayView(openQRPage: .constant(true), openPinPage: .constant(true))
    }
}
