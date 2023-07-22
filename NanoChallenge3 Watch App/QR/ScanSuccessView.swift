//
//  ScanSuccessView.swift
//  NanoChallenge3 Watch App
//
//  Created by Muhammad Naufal Nabiel on 20/07/23.
//

import SwiftUI

struct ScanSuccessView: View {
    var isMRTPay = true
    @EnvironmentObject var router: Router
    @State private var timeLeft: Int = 3 // 3 minutes in seconds
    @State private var successTimer: Timer?
    var body: some View {
        VStack {
            ZStack {
                Circle().frame(width: 100)
                Button(action: {
                    print("Pressed")
                    router.path.append(3)
                    cancelSuccessTimer()
                }, label: {
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                    .foregroundColor(.green).frame(width: 100, height: 100)
                }).buttonStyle(BorderlessButtonStyle())
            }
            
            Text("Payment Successful").font(.system(size:12)).foregroundColor(.gray).padding()
           
            if isMRTPay == true {
                Text("Balance: Rp 54.000").font(.system(size:15)).fontWeight(.regular)
            }
        }.onAppear(perform: startSuccessTimer)
        .navigationBarBackButtonHidden(true)
        
    }
    
    private func startSuccessTimer() {
        successTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeLeft > 0 {
                timeLeft -= 1
            } else {
                router.path.append(3)
                cancelSuccessTimer()
            }
        }
    }
    
    private func cancelSuccessTimer() {
        successTimer?.invalidate()
        successTimer = nil
    }
}

struct ScanSuccessView_Previews: PreviewProvider {
    static var previews: some View {
        ScanSuccessView()
    }
}
