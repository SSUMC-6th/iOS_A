//
//  CouponBanner.swift
//  Week6_Mission
//
//  Created by Jiwoong CHOI on 5/14/24.
//

import SwiftUI

struct CouponBannerView: View {
  var body: some View {
    RoundedRectangle(cornerRadius: 20)
      .foregroundStyle(Color.white)
      .frame(height: 80)
      .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.green, lineWidth: 5))
      .overlay(content: {
        Text("집콕러세요? 30% 쿠폰 드려요!")
      })
      .padding(10)
  }
}

#Preview {
  CouponBannerView()
}
