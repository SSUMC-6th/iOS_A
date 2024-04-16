//
//  CouponBanner.swift
//  Week1_Mission
//
//  Created by Jiwoong CHOI on 4/6/24.
//

import SwiftUI

struct CouponBanner: View {
    var body: some View {
        HStack {
            Text("집콕러세요? 30% 쿠폰 드려요!")
            Image(systemName: "ticket.fill")
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
    }
}

#Preview {
    CouponBanner()
}
