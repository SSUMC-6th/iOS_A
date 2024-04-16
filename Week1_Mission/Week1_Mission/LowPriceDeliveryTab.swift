//
//  LowPriceDeliveryView.swift
//  Week1_Mission
//
//  Created by Jiwoong CHOI on 4/4/24.
//

import SwiftUI

struct LowPriceDeliveryTab: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("알뜰배달")
            Text("쿠폰 골라 받기")
        }
        .frame(width: 70, height: 70, alignment: .center)
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

#Preview {
    LowPriceDeliveryTab()
}
