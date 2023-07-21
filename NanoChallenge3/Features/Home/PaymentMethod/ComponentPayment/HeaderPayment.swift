//
//  HeaderPayment.swift
//  NanoChallenge3
//
//  Created by Geraldy Kumara on 18/07/23.
//

import SwiftUI

struct HeaderPayment: View {
    
    @Environment(\.presentationMode) private var presentationMode
    let text: String
    let title: String
    
    init(text: String = "Home", title: String = "Payment Method") {
        self.text = text
        self.title = title
    }
    
    var body: some View {
        ZStack{
            Color("blueBase").ignoresSafeArea()
                .frame(maxHeight: 44)
            HStack{
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .frame(maxWidth: 17, maxHeight: 22)
                        .foregroundColor(.white)
                        .padding(.leading)
                    
                    Text("\(text)")
                        .foregroundColor(.white)
                        .font(.system(size: 17))
                }
                
                Spacer()
                Text("\(title)")
                    .foregroundColor(.white)
                    .font(.system(size: 17))
                    .bold()
                    .padding(.leading, -85)
                Spacer()
            }
        }
    }
}

struct HeaderPayment_Previews: PreviewProvider {
    static var previews: some View {
        HeaderPayment()
    }
}
