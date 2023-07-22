//
//  ScanMRTPayView.swift
//  NanoChallenge3 Watch App
//
//  Created by Muhammad Naufal Nabiel on 20/07/23.
//

import SwiftUI

struct ScanMRTPayView: View {
    @EnvironmentObject var router: Router
    @State private var expiration: Int = 180 // 3 minutes in seconds
    @State private var timer: Timer?
    
    var body: some View {
            ScrollView {
                VStack {
                    HStack {
                        Spacer()
                        //@Adi bisa tambahin condition if ScanIn or ScanOut
                        Text("Scan In").font(.title3).foregroundColor(.blue).fontWeight(.medium)
                    }.padding(.horizontal)
                    Image("QR_IN").resizable().frame(width: 120, height: 120)
                    Text("Expired in: \(formatExpiration(expiration))").font(.system(size: 12)).foregroundColor(.gray).padding(.top)
                }
            }.navigationTitle{
                HStack {
                    Button(action: {
                        router.reset()
                    }) {
                        ExitButtonView().frame(width:25)
                    }.buttonStyle(.borderless).offset(x:5)
                Spacer()
                }
            }.navigationBarBackButtonHidden()
            .onAppear(perform: {
            startTimer()
        })
        .onDisappear(perform: {
            cancelTimer()
        })
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if expiration > 0 {
                expiration -= 1
            } else {
                router.reset()
                cancelTimer()
            }
        }
    }
    
    private func cancelTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func formatExpiration(_ seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

struct ScanMRTPayView_Previews: PreviewProvider {
    static var previews: some View {
        ScanMRTPayView().environmentObject(Router())
    }
}
