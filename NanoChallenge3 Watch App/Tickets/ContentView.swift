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
    
    var body: some View {
        EmptyTicketView().environmentObject(router)
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Router())
    }
}

