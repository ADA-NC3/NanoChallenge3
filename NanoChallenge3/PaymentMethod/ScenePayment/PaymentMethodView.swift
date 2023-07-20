//
//  paymentMethodView.swift
//  NanoChallenge3
//
//  Created by Geraldy Kumara on 18/07/23.
//

import SwiftUI

struct PaymentMethodView: View {
    
    @State private var isChecked: Bool = false
    @State private var isShowingNextView: Bool = false
    @State private var isCheckedAstra: Bool = false
    @State private var isCheckedIsaku: Bool = false
    @State private var isCheckedBlu: Bool = false
    
    var body: some View{
        NavigationStack{
            VStack{
                HeaderPayment(text: "Home", title: "Payment Method")
                VStack(alignment: .leading) {
                    HStack{
                        Text("From")
                        Spacer()
                        Text("To")
                            .offset(x: -115)
                    }
                    .foregroundColor(.gray)
                    .padding(.top, 10)
                   
                    HStack{
                        Text("Blok M")
                            .padding(10)
                            .frame(maxWidth: 120)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.gray)
                            )
                        
                        Image(systemName: "arrow.right")
                            .resizable()
                            .frame(maxWidth: 20, maxHeight: 15)
                            .foregroundColor(.gray)
                            .offset(x: 10)
                        
                        Text("Lb. Bulus")
                            .padding(10)
                            .frame(maxWidth: 120)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.gray)
                            )
                            .offset(x: 20)
                    }
                    .padding(.horizontal, 2)
                    .offset(y: -5)
                    
                    
                    HStack{
                        Text("Price")
                            .foregroundColor(.gray)
                        Spacer()
                        Text("Rp. 8.000")
                            .foregroundColor(.black)
                            .font(.system(size: 17))
                            .bold()
                    }
                    .padding(EdgeInsets(top: 20, leading: 5, bottom: 10, trailing: 10))
                    
                }
                .padding()
                .font(.system(size: 15))
                .frame(maxWidth: 340, maxHeight: 156)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.gray, lineWidth: 1)
                )
                .padding(.top, 20)
                
                VStack{
                    Text("Choose Payment Method")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .bold()
                        .offset(x: -50)
                        .padding([.top, .bottom], 30)
                    
                    HStack{
                        Text("Bank")
                            .padding(.leading, 30)
                        Spacer()
                    }

                    Divider()
                        .frame(maxWidth: 340)
                   
                                
                    ChoosePayment(isChecked: $isCheckedAstra, image: "astraPay")
                        .onTapGesture {
                            isCheckedAstra.toggle()
                            if isCheckedAstra {
                                isChecked = true
                                isCheckedBlu = false
                                isCheckedIsaku = false
                            }
                        }
                    
                    ChoosePayment(isChecked: $isCheckedIsaku, image: "isaku")
                        .onTapGesture {
                            isCheckedIsaku.toggle()
                            if isCheckedIsaku {
                                isChecked = true
                                isCheckedAstra = false
                                isCheckedBlu = false
                            }
                        }
                   
                    HStack{
                        Text("Bank")
                            .padding(.leading, 30)
                             .padding(.top, 30)
                        Spacer()
                    }

                    Divider()
                        .frame(maxWidth: 340)
                    
                    ChoosePayment(isChecked: $isCheckedBlu, image: "blu")
                        .onTapGesture {
                            isCheckedBlu.toggle()
                            if isCheckedBlu {
                                isChecked = true
                                isCheckedAstra = false
                                isCheckedIsaku = false
                            }
                        }
                    
                    Spacer()
                    
                    Button {
                        isShowingNextView = true
                    } label: {
                        Text("Proceed Payment")
                            .foregroundColor(.white)
                            .frame(maxWidth: 300, maxHeight: 42)
                            .background(isChecked == true ?  Color("blueBase") : .gray)
                            .cornerRadius(12)
                    }
                    .disabled(isChecked == false)
                    
                }
                .navigationDestination(isPresented: $isShowingNextView){
                    PayView()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct paymentMethodView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentMethodView()
    }
}

