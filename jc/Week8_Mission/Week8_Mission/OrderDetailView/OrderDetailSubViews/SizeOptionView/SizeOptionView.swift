//
//  SizeOptionView.swift
//  Week8_Mission
//
//  Created by Jiwoong CHOI on 6/6/24.
//

import SwiftUI

struct SizeOptionView: View {
  @StateObject var orderSystem : OrderSystem
  
  var body: some View {
    VStack {
      HStack {
        Text("가격")
          .font(.title2)
          .bold()
        Spacer()
        Text("필수")
          .font(.caption)
          .foregroundStyle(.blue)
          .padding([.top, .bottom], 5)
          .padding([.leading, .trailing], 7)
          .background(
            RoundedRectangle(cornerRadius: 15)
              .fill(.blue.opacity(0.1))
          )
      }

      MediumSizeOptionView(orderSystem: self.orderSystem)
      
      LargeSizeOptionView(orderSystem: self.orderSystem)
    }
    .padding()
  }
}
