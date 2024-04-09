//
//  DeliveryView.swift
//  Week1_Mission
//
//  Created by Jiwoong CHOI on 4/4/24.
//

import SwiftUI

struct DeliveryTab: View {
    var body: some View {
        VStack(alignment:.leading) {
            Text("배달")
            Text("세상은 넓고")
            Text("맛집은 많다")

        }
        .frame(width: 70, height: 70, alignment: .center)
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

#Preview {
    DeliveryTab()
}
