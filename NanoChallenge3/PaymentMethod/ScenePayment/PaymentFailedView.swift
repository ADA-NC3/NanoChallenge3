//
//  PaymentFailedView.swift
//  NanoChallenge3
//
//  Created by Geraldy Kumara on 19/07/23.
//

import SwiftUI

struct PaymentFailedView: View {
    var body: some View {
        VStack{
            Image("paymentFailed")
            
            Text("Payment Failed")
                .font(.system(size: 17, weight: .semibold))
                .padding(.top, 40)
            
            Text("These are problem on our side,")
                .padding(.top, 12)
            
            Text("Please retry")
                .font(.system(size: 15))
        }
    }
}

struct PaymentFailedView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentFailedView()
    }
}
