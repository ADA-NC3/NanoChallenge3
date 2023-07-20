//
//  TicketCardView.swift
//  NanoChallenge3
//
//  Created by Falah Hasbi Assidiqi on 18/07/23.
//

import SwiftUI

struct TicketCardView: View {
    
    var model: MyTicketModel
    @Environment(\.dismiss) private var dismiss
    @StateObject private var vm = MyTicketViewModel()
    
    var body: some View {
        HStack(spacing: 36) {
            Image("QRCode")
                .resizable()
                .frame(width: 80, height: 80)
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("From")
                            .foregroundColor(Color(uiColor: .gray_base))
                        Text(model.departure)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(alignment: .leading) {
                        Text("To")
                            .foregroundColor(Color(uiColor: .gray_base))
                        Text(model.destination)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                VStack(alignment: .leading) {
                    Text("Date")
                        .foregroundColor(Color(uiColor: .gray_base))
                    Text(model.date)
                }
            }
            .font(.subheadline)
        }
        .padding(.leading, 36)
        .padding(.vertical, 20)
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .inset(by: 0.5)
                .stroke(Color(uiColor: .gray_base), lineWidth: 1)
        }
        .onTapGesture {
            vm.sheetDetailTicket = true
        }
        .sheet(isPresented: $vm.sheetDetailTicket, onDismiss: {
            dismiss()
        }, content: {
            DetailTicketView(model: model)
        })
    }
}

struct TicketCardView_Previews: PreviewProvider {
    static var previews: some View {
        TicketCardView(model: MyTicketModel(departure: "Lb. Bulus", destination: "Blok M", date: "17 July 2023"))
    }
}
