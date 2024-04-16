//
//  SpecialPrice.swift
//  Week1_Mission
//
//  Created by Jiwoong CHOI on 4/4/24.
//

import SwiftUI

struct SpecialPrice: View {
    var body: some View {
        VStack {
            Image(systemName: "flame.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundStyle(.red)
                .padding()
                .background(.gray.opacity(0.2))
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            Text("특가")
        }
        .padding()    }
}

#Preview {
    SpecialPrice()
}
