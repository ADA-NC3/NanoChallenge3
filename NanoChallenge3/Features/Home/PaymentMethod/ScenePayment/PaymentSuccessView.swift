//
//  PaymentSuccessView.swift
//  NanoChallenge3
//
//  Created by Geraldy Kumara on 18/07/23.
//

import SwiftUI

struct PaymentSuccessView: View {
    
    @State private var isTapped: Bool = false
    
    var body: some View {
        ZStack{
            Color("blueBase").ignoresSafeArea()
            Button {
                withAnimation {
                    isTapped = true
                }
            } label: {
                VStack{
                    Image("paymentSuccess")
                    Text("Payment Succeed")
                        .font(.system(size: 20, weight: .semibold))
                        .padding(.top, 40)
                    Text("Thank you for choosing MRTJ!")
                        .font(.system(size: 15))
                        .padding(.top, 12)
                }
            }
            .foregroundColor(.white)
            .navigationDestination(isPresented: $isTapped) {
                PaymentMethodView()
            }
        }
        .navigationBarBackButtonHidden(true)
        
    }
}

struct PaymentSuccessView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentSuccessView()
    }
}
