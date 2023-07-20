//
//  PinMRTPayView.swift
//  NanoChallenge3
//
//  Created by Alfine on 20/07/23.
//

import SwiftUI

struct PinMRTPayView: View {
    @State var mrtPayPIN1 = ""
    @State var mrtPayPIN2 = ""
    @State var mrtPayPIN3 = ""
    @State var mrtPayPIN4 = ""
    
    @FocusState private var checkoutInFocus: CheckoutFocusable?
    
    var body: some View {
        
        let pin1 = Binding(
            get: { self.mrtPayPIN1 },
            set: { self.mrtPayPIN1 = String($0.prefix(1))}
        )
        let pin2 = Binding(
            get: { self.mrtPayPIN2 },
            set: { self.mrtPayPIN2 = String($0.prefix(1))}
        )
        let pin3 = Binding(
            get: { self.mrtPayPIN3 },
            set: { self.mrtPayPIN3 = String($0.prefix(1))}
        )
        let pin4 = Binding(
            get: { self.mrtPayPIN4 },
            set: { self.mrtPayPIN4 = String($0.prefix(1))}
        )
        
        NavigationView {
            ZStack{
                Color(uiColor: .blue_base)
                    .ignoresSafeArea()
                VStack{
                    Text("Input your PIN")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    HStack(spacing: 20){
                        SecureField("", text: pin1)
                            .font(.system(size: 64))
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .frame(width: 72, height: 72)
                            .background(.white)
                            .cornerRadius(20)
                            .keyboardType(.numberPad)
                            .focused($checkoutInFocus, equals: .form1)
                            .onChange(of: mrtPayPIN1) { newValue in
                                if newValue.count == 1 {
                                    checkoutInFocus = .form2
                                } else {
                                    checkoutInFocus = .form1
                                }
                            }
                        SecureField("", text: pin2)
                            .font(.system(size: 64))
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .frame(width: 72, height: 72)
                            .background(.white)
                            .cornerRadius(20)
                            .keyboardType(.numberPad)
                            .focused($checkoutInFocus, equals: .form2)
                            .onChange(of: mrtPayPIN2) { newValue in
                                if newValue.count == 1 {
                                    checkoutInFocus = .form3
                                } else {
                                    checkoutInFocus = .form1
                                }
                            }
                        SecureField("", text: pin3)
                            .font(.system(size: 64))
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .frame(width: 72, height: 72)
                            .background(.white)
                            .cornerRadius(20)
                            .keyboardType(.numberPad)
                            .focused($checkoutInFocus, equals: .form3)
                            .onChange(of: mrtPayPIN3) { newValue in
                                if newValue.count == 1 {
                                    checkoutInFocus = .form4
                                } else {
                                    checkoutInFocus = .form2
                                }
                            }
                        SecureField("", text: pin4)
                            .font(.system(size: 64))
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .frame(width: 72, height: 72)
                            .background(.white)
                            .cornerRadius(20)
                            .keyboardType(.numberPad)
                            .focused($checkoutInFocus, equals: .form4)
                            .onChange(of: mrtPayPIN4) { newValue in
                                if newValue.count == 1 {
                                    //TODO: CHANGE PAGE
                                    
                                } else if newValue.count == 0 {
                                    checkoutInFocus = .form3
                                }
                            }
                    }
                    .padding(.vertical, 10)
                    Text("Forgot your PIN?")
                        .font(.footnote)
                        .foregroundColor(.white)
                }
            }
            .onAppear{
                checkoutInFocus = .form1
            }
        }
    }
    
    enum CheckoutFocusable: Hashable {
        case form1
        case form2
        case form3
        case form4
    }
}

struct PinMRTPayView_Previews: PreviewProvider {
    static var previews: some View {
        PinMRTPayView()
    }
}
