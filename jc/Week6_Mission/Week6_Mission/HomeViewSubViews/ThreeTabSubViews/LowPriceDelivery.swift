//
//  LowPriceDelivery.swift
//  Week6_Mission
//
//  Created by Jiwoong CHOI on 5/14/24.
//

import SwiftUI

struct LowPriceDelivery: View {
  private let cornerRadius: CGFloat = 20
  private let size: CGFloat = 110

  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: self.cornerRadius)
        .foregroundStyle(Color.white)
        .frame(width: self.size, height: self.size, alignment: .center)
        .overlay {
          VStack {
            HStack {
              Text("알뜰배달")
              Spacer()
            }
            Text("쿠폰 골라 받기")
              .font(.caption)
          }.padding()

        }

    }
  }
}

#Preview {
  LowPriceDelivery()
}
