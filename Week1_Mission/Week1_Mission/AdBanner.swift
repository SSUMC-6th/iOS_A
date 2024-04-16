//
//  AdBanner.swift
//  Week1_Mission
//
//  Created by Jiwoong CHOI on 4/6/24.
//

import SwiftUI

struct AdBanner: View {
    var body: some View {
        VStack {
            Text("신전떡볶이 특급 할인!")
            HStack {
                VStack {
                    Text("최")
                    Text("대")
                }
                Text("7000원 할인")
            }
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

#Preview {
    AdBanner()
}
