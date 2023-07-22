//
//  ExitButtonView.swift
//  NanoChallenge3 Watch App
//
//  Created by Muhammad Naufal Nabiel on 22/07/23.
//

import Foundation
import SwiftUI

struct ExitButtonView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color(white: colorScheme == .dark ? 0.19 : 0.93))
            Image(systemName: "xmark")
                .resizable()
                .scaledToFit()
                .font(Font.body.weight(.bold))
                .scaleEffect(0.416)
                .foregroundColor(Color(white: colorScheme == .dark ? 0.62 : 0.51))
        }
    }
}

struct ExitButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ExitButtonView()
    }
}
