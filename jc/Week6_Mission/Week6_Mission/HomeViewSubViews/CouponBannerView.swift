//
//  CouponBanner.swift
//  Week6_Mission
//
//  Created by Jiwoong CHOI on 5/14/24.
//

import SwiftUI

struct CouponBannerView: View {
    var body: some View {
      ZStack {
        RoundedRectangle(cornerRadius: 20)
          .foregroundStyle(Color.white)
          .frame(width: 370, height: 100, alignment: .center)
          .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.green, lineWidth: 5))
        
        Text("집콕러세요? 30% 쿠폰 드려요!")
      }
    }
}

#Preview {
    CouponBannerView()
}
