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
        // MARK: Cutome Picker
        UISegmentedControl.appearance().backgroundColor = .gray2_base
        UISegmentedControl.appearance().setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.blue_base
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white_base], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.gray_base], for: .normal)
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                pickerView
                    .padding(.horizontal, 37)
                
                if vm.selectedPicker == 0 {
                    ForEach(Array(vm.activeTickets.enumerated()), id: \.element.id) { (index, ticket) in
                        TicketCardView(model: ticket)
                            .padding(.bottom)
                    }
                    
                } else {
                    TicketCardView(model: vm.historyTicket)
                        .padding(.bottom)
                }
                
                Spacer()
            }
            .padding(.horizontal, 25)
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
    
    private var pickerView: some View {
        Picker("My Ticket", selection: $vm.selectedPicker) {
            Text("Active Ticket").tag(0)
            Text("History").tag(1)
        }
        .padding(.top, 62)
        .padding(.bottom, 32)
        .pickerStyle(.segmented)
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
