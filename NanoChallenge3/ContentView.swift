//
//  ContentView.swift
//  NanoChallenge3
//
//  Created by Nyoman Adiwinanda on 14/07/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            TabView{
                HomeView()
                    .tabItem{
                        Label {
                            Text("Home")
                        } icon: {
                            Image(systemName: "house.fill")
                        }
                    }
                
                MyTicketView()
                    .tabItem {
                        Label {
                            Text("My Ticket")
                        } icon: {
                            Image(systemName: "creditcard.fill")
                        }
                    }
                
//                ProfileView()
//                    .tabItem{
//                        Label {
//                            Text("Profile")
//                        } icon: {
//                            Image(systemName: "person.fill")
//                        }
//                    }
            }
            .accentColor(Color("blueBase"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
