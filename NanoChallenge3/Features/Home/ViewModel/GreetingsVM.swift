//
//  GreetingsVM.swift
//  NanoChallenge3
//
//  Created by Alfine on 18/07/23.
//

import SwiftUI

extension HomeView{
    func generateGreeting() -> String{
        var greetings: String
        let hour = Calendar.current.component(.hour, from: Date())
        if hour >= 4 && hour < 12 {
            greetings = "Morning"
        }else if hour >= 12 && hour < 18 {
            greetings = "Afternoon"
        }else {
            greetings = "Evening"
        }
        return greetings
    }
}
