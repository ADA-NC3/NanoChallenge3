//
//  Router.swift
//  NanoChallenge3 Watch App
//
//  Created by Muhammad Naufal Nabiel on 21/07/23.
//

import Foundation
import SwiftUI

class Router: ObservableObject {
    @Published var path = NavigationPath()
    
    func reset(){
        self.path = NavigationPath()
    }
    
    
}
