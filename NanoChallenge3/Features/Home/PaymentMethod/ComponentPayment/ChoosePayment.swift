//
//  choosePayment.swift
//  NanoChallenge3
//
//  Created by Geraldy Kumara on 18/07/23.
//

import SwiftUI

struct ChoosePayment: View {
    
    @Binding var isChecked: Bool
    @State var image: String
    
    var body: some View {
        VStack{
            
            HStack{
                Image(image)
                Spacer()
                Image(isChecked == true ? "checked" : "unchecked")
            }
            .padding(.horizontal, 30)
            .padding(.top, 15)
        }
    }
}

struct choosePayment_Previews: PreviewProvider {
    static var previews: some View {
        ChoosePayment(isChecked: .constant(false), image: "isaku")
    }
}
