//
//  ContentView.swift
//  NanoChallenge3 Watch App
//
//  Created by Nyoman Adiwinanda on 14/07/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var router: Router
    @State var path: [Int] = []
    @State var count: Int = 0
    
    //Placeholders
    //"14.05", "14.12","14.13","14.14","14.15"
    //Bisa diganti ke list of tickets yg udh kebeli
    var tickets: [String] = []

    var body: some View {
        NavigationStack(path: $router.path){
            if tickets.isEmpty {
                EmptyTicketView().environmentObject(router)
            }else{
                TicketListView(times: tickets).environmentObject(router)
            }
        }
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Router())
    }
}

