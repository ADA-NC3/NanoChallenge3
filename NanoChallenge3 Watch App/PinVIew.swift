//
//  PinVIew.swift
//  NanoChallenge3 Watch App
//
//  Created by Muhammad Naufal Nabiel on 20/07/23.
//

import SwiftUI

struct PinView: View {
    @Environment(\.scenePhase) private var scenePhase
    @State private var coverIsPresented = false
    @State private var password = ""
    
    var body: some View {
        VStack {
            Text("Enter PIN")
                .padding()
                .onChange(of: scenePhase, perform: { value in
                    coverIsPresented = true
                })
                .fullScreenCover(isPresented: $coverIsPresented) {
                    TextField("Enter PIN", text: $password)
                    Button("OK") {
                        if password == "1234" {
                            coverIsPresented = false
                        }
                    }
            }
        }.navigationTitle("PIN")
    }
}

struct PinView_Previews: PreviewProvider {
    static var previews: some View {
        PinView()
    }
}
