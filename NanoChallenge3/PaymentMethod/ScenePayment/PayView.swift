//
//  PayView.swift
//  NanoChallenge3
//
//  Created by Geraldy Kumara on 18/07/23.
//

import SwiftUI

struct PayView: View {
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @State private var isPay: Bool = false
    
    var body: some View {
        VStack{
            HeaderPayment(text: "Method", title: "I.Saku")
            
            Image("isakuLogo")
                .padding(.vertical, 30)
            
            VStack{
                HStack{
                    Text("Order Number")
                    Spacer()
                    Text("0fc2fa1ec31c1eb004cb")
                        .bold()
                }
                .padding(.bottom, 10)
                
                HStack{
                    Text("Current Balance")
                    Spacer()
                    Text("Rp 243.000")
                }
                .padding(.bottom, 10)

                HStack{
                    Text("Total")
                    Spacer()
                    Text("Rp 8.000")
                        .bold()
                }
                .padding(.bottom, 10)

            }
            .padding(.horizontal,30)
            .padding(.vertical,5)
            Divider()
                .frame(maxWidth: 340)
            
            Spacer()
            
            NavigationLink{
                //isPay = true
                PaymentSuccessView()
            } label: {
                Text("Pay")
                    .foregroundColor(.white)
                    .frame(maxWidth: 300, maxHeight: 42)
                    .background(Color("blueBase") )
                    .cornerRadius(12)
            }
            .padding(.bottom, 8)
            
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct PayView_Previews: PreviewProvider {
    static var previews: some View {
        PayView()
    }
}
