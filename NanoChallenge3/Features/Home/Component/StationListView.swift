//
//  StationListView.swift
//  NanoChallenge3
//
//  Created by Alfine on 18/07/23.
//

import SwiftUI

struct StationListView: View {

    var station: String

    var body: some View {
        VStack {
            HStack{
                Text(station)
                    .font(.body)
                    .padding(.top, 22)
                    .padding(.bottom, 16)
                    .padding(.horizontal, 24)
                Spacer()
            }
            Divider()
        }
    }
}

struct StationListView_Previews: PreviewProvider {
    static var previews: some View {
        StationListView(station: "Duku Atas")
    }
}
