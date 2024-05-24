//
//  AdBannerView.swift
//  Week6_Mission
//
//  Created by Jiwoong CHOI on 5/14/24.
//

import SwiftUI

struct AdBannerView: View {
  private let cornerRadius: CGFloat = 20

  var body: some View {
    RoundedRectangle(cornerRadius: self.cornerRadius)
      .foregroundStyle(Color.white)
      .overlay(content: {
        Text("여기는 광고배너입니다.")
      })
      .padding(10)
  }
}

#Preview {
  AdBannerView()
}
