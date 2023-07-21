//
//  NanoChallenge3App.swift
//  NanoChallenge3 Watch App
//
//  Created by Nyoman Adiwinanda on 14/07/23.
//

import SwiftUI

@main
struct NanoChallenge3_Watch_AppApp: App {
    @StateObject var router = Router()
        var body: some Scene {
            WindowGroup {
                ContentView()
                    .environmentObject(router)
            }
        }
}
