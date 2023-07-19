//
//  DetailTicketView.swift
//  NanoChallenge3
//
//  Created by Falah Hasbi Assidiqi on 19/07/23.
//

import SwiftUI

struct DetailTicketView: View {
    
    var model: MyTicketModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Text("\(model.departure)")
                    .font(.largeTitle).bold()
                
                Image("QRCode")
                    .resizable()
                    .frame(width: 220, height: 220)
                
                HStack {
                    Text("From **\(model.departure)**")
                    
                    Spacer()
                    
                    Text("To **\(model.destination)**")
                }
            }
            .padding(.horizontal, 45)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Close")
                            .foregroundColor(Color(uiColor: .blue_base))
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    Text("Scan In")
                        .font(.headline)
                }
            }
        }
    }
}

struct DetailTicketView_Previews: PreviewProvider {
    static var previews: some View {
        DetailTicketView(model: MyTicketModel(departure: "Blok M", destination: "Lb. Bulus", date: "17 July 2023"))
    }
}
