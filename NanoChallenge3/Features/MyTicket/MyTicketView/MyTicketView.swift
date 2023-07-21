//
//  MyTicketView.swift
//  NanoChallenge3
//
//  Created by Falah Hasbi Assidiqi on 18/07/23.
//

import SwiftUI

struct MyTicketView: View {
    
    @StateObject private var vm = MyTicketViewModel()
    
    init() {
        // MARK: Custom Picker
        UISegmentedControl.appearance().backgroundColor = .gray2_base
        UISegmentedControl.appearance().setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.blue_base
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white_base], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.gray_base], for: .normal)
    }
    
    var body: some View {
        NavigationStack {
            if vm.isPurchased {
                purchasedView
            } else {
                notPurchasedView
            }
        }
        .overlay {
            titleTicketView
        }
        .navigationBarBackButtonHidden()
    }
}

struct MyTicketView_Previews: PreviewProvider {
    static var previews: some View {
        MyTicketView()
    }
}

extension MyTicketView {
    
    private var purchasedView: some View {
        VStack(alignment: .center) {
            Picker("My Ticket", selection: $vm.selectedPicker) {
                Text("Active Ticket").tag(0)
                Text("History").tag(1)
            }
            .padding(EdgeInsets(top: 62, leading: 37, bottom: 32, trailing: 37))
            .pickerStyle(.segmented)
            
            if vm.selectedPicker == 0 {
                ForEach(Array(vm.activeTickets.enumerated()), id: \.element.id) { (index, ticket) in
                    TicketCardView(model: ticket)
                        .padding(.bottom)
                }
                
            } else {
                TicketCardView(model: vm.historyTicket)
                    .padding(.bottom)
                    .disabled(true)
            }
            
            Spacer()
        }
        .padding(.horizontal, 25)
    }
    
    private var notPurchasedView: some View {
        VStack {
            Image("mrtnangis")
                .padding(.bottom, 10)
            
            Text("You haven't purchase any ticket")
            
            Text("Please buy it first")
                .padding(.bottom, 20)
            
            NavigationLink {
                HomeView()
            } label: {
                Text("Purchase Ticket")
                    .frame(width: 300, height: 45)
                    .foregroundColor(.white)
                    .background(Color(uiColor: .blue_base))
                    .cornerRadius(12)
            }
        }
    }
    
    private var titleTicketView: some View {
        HStack {
            Text("My Ticket")
                .font(.headline)
                .padding(.vertical, 11)
                .frame(maxWidth: .infinity, alignment: .center)
        }
        .foregroundColor(Color(uiColor: .white_base))
        .background(Color(uiColor: .blue_base))
        .frame(maxHeight: .infinity, alignment: .top)
    }
}
