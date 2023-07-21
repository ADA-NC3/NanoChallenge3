//
//  MRTPayView.swift
//  NanoChallenge3
//
//  Created by Alfine on 17/07/23.
//

import SwiftUI

struct MRTPayView: View {
    @Binding var openPinPage: Bool
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("Current Balance")
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .foregroundColor(Color(UIColor.gray_base))
                    .padding(.bottom, -5)
                Text("Rp. \("243.000")")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                HStack{
                    Button {
                        //TODO: OPEN QR BUTTON ACTION
                        openPinPage = true
                    } label: {
                        Image(systemName: "qrcode")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    .frame(width: 46, height: 46)
                    .background(Color(UIColor.blue_base))
                    .cornerRadius(12)
                    Button {
                        //TODO: TOP UP BUTTON ACTION
                        
                    } label: {
                        Text("Top Up")
                            .font(.body)
                            .fontWeight(.regular)
                            .frame(width: 96, height: 46)
                            .foregroundColor(Color(UIColor.blue_base))
                            .background(.white)
                            .overlay( /// apply a rounded border
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color(UIColor.blue_base), lineWidth: 1)
                            )
                    }
                    Button {
                        //TODO: OPEN PAYMENT HISTORY BUTTON ACTION
                        
                    } label: {
                        Text("History")
                            .font(.body)
                            .fontWeight(.regular)
                            .frame(width: 96, height: 46)
                            .foregroundColor(Color(UIColor.blue_base))
                            .background(.white)
                            .overlay( /// apply a rounded border
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color(UIColor.blue_base), lineWidth: 1)
                            )
                    }
                }
                .padding(.top, -7)
            }
            Spacer()
        }
    }
}

struct MRTPayView_Previews: PreviewProvider {
    static var previews: some View {
        MRTPayView(openPinPage: .constant(true))
    }
}
