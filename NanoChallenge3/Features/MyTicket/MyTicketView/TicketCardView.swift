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
        ZStack {
            Image("ticketBackground")
            VStack {
                HStack {
                    Text("From")
                    
                    Spacer()
                    
                    Text("To")
                }
                .padding(.top)
                .font(.caption)
                .foregroundColor(Color(uiColor: .gray_base))
                
                HStack {
                    Text(model.departure)
                        .font(.headline)
                        .foregroundColor(Color(uiColor: .blue_base))
                    
                    Spacer()
                    
                    Image(systemName: "arrow.right")
                        .foregroundColor(Color(uiColor: .gray_base))
                    
                    Spacer()
                    
                    Text(model.destination)
                        .font(.headline)
                        .foregroundColor(Color(uiColor: .blue_base))
                }
                .padding(.bottom, 14)
                
                HStack {
                    Text("Price")
                        .foregroundColor(Color(uiColor: .gray_base))
                    
                    Spacer()
                    
                    Text("Rp. 20.000")
                        .foregroundColor(Color(uiColor: .blue_base))
                }
                .font(.caption)
                
                Line()
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [10]))
                    .frame(height: 1)
                    .padding(.bottom, 5)
                    .foregroundColor(Color(uiColor: .gray_base))
                
                HStack {
                    Text("Expired Date")
                        .foregroundColor(Color(uiColor: .gray_base))
                    
                    Spacer()
                    
                    Text(model.date)
                }
                .font(.caption)
                .padding(.bottom, 20)
            }
            .padding(.horizontal)
            .frame(width: 340, height: 133)
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
    
}

struct TicketCardView_Previews: PreviewProvider {
    static var previews: some View {
        TicketCardView(model: MyTicketModel(departure: "Departure", destination: "Destination", date: "Date"))
    }
}
