//
//  PasswordView.swift
//  NanoChallenge3 Watch App
//
//  Created by Muhammad Naufal Nabiel on 22/07/23.
//

import SwiftUI

struct PasswordView: View {
    @State private var pinDigits: [String] = []
    @State private var isPinCorrect = false
    @State private var showAlert = false
    @EnvironmentObject var router: Router
    //Placeholder
    let correctPIN = ["1", "2", "3", "4"]
    
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                if pinDigits.isEmpty{
                    Text("Enter Pin")
                        .foregroundColor(.gray)
                        .font(.body)
                }else if showAlert == true{
                    Text("PIN is wrong")
                        .foregroundColor(.gray)
                        .font(.body)
                }else{
                    
                    ForEach(pinDigits.indices, id: \.self) { index in
                        Indicator(pinDigits: $pinDigits, index: index)
                    }
                }
                
            }.padding(.bottom)
            
            Spacer()
            
            NumberPad(pinDigits: $pinDigits)
            
        }.offset(y: 5)
            .padding()
            .navigationTitle{
                HStack {
                    Button(action: {
                        router.reset()
                    }) {
                        ExitButtonView().frame(width:25)
                    }.buttonStyle(.borderless).offset(x:5)
                Spacer()
                }
            }.navigationBarBackButtonHidden()
            .onChange(of: pinDigits) { newValue in
                
                if newValue.count < 4 {
                    showAlert = false
                }
                else if newValue.count == 4 {
                    if pinDigits == correctPIN {
                        router.path.append(2)
                        isPinCorrect = true
                        WKInterfaceDevice.current().play(.success)
                    } else {
                        // Incorrect PIN, show the alert
                        showAlert = true
                        WKInterfaceDevice.current().play(.failure)
                    }
                }
            }
    }
    struct NumberPad: View {
        @Binding var pinDigits: [String]
        
        let rows: [[String]] = [
            ["1", "2", "3"],
            ["4", "5", "6"],
            ["7", "8", "9"],
            ["", "0", "Delete"]
        ]
        
        var body: some View {
            VStack(spacing: 5) {
                ForEach(rows, id: \.self) { row in
                    HStack(spacing: 5) {
                        ForEach(row, id: \.self) { digit in
                            Button(action: {
                                if digit == "Delete" {
                                    print("Before: \(pinDigits)")
                                    pinDigits = Array(pinDigits.dropLast(1))
                                    print("After: \(pinDigits)")
                                } else {
                                    if pinDigits.count < 4 && !digit.isEmpty { // Fix: prevent adding an empty string
                                        print("Before: \(pinDigits)")
                                        pinDigits.append(digit)
                                        print("After: \(pinDigits)")
                                        
                                    }
                                }
                            }) {
                                if digit == "Delete" {
                                    Image(systemName: "delete.left")
                                        .font(.title3)
                                        .frame(width: 52, height: 27)
                                        .foregroundColor(.white)
                                        .background(Color(#colorLiteral(red: 0.2823529412, green: 0.2823529412, blue: 0.2901960784, alpha: 1)))
                                        .cornerRadius(8)
                                } else if digit == "" {
                                    Text(digit)
                                        .font(.title3)
                                        .frame(width: 52, height: 27)
                                        .foregroundColor(.white)
                                        .background(.black)
                                        .cornerRadius(8)
                                }else {
                                    Text(digit)
                                        .font(.title3)
                                        .frame(width: 52, height: 27)
                                        .foregroundColor(.white)
                                        .background(Color(#colorLiteral(red: 0.2823529412, green: 0.2823529412, blue: 0.2901960784, alpha: 1)))
                                        .cornerRadius(8)
                                }
                            }
                            .buttonStyle(PlainButtonStyle()) // Add this line to fix the tap issue
                        }
                    }
                }
            }
        }
    }

    struct Indicator: View {
        @Binding var pinDigits: [String]
        var index: Int
        
        var body: some View {
            let digit = index < pinDigits.count ? pinDigits[index] : ""
            let hiddenDigit = index == pinDigits.count - 1 ? digit : "*"
            
            ZStack {
                Text(hiddenDigit)
                    .foregroundColor(.gray)
                    .font(.body)
            }
        }
    }
}

struct PasswordView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordView().environmentObject(Router())
    }
}
