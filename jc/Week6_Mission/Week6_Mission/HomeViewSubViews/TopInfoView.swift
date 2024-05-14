//
//  WidthSizeRectangle.swift
//  Week6_Mission
//
//  Created by Jiwoong CHOI on 5/14/24.
//

import SwiftUI

struct TopInfoView: View {
  var body: some View {
    Rectangle()
      .foregroundColor(.mint)
      .frame(width: 400, height: 150, alignment: .center)
      .clipShape(
        UnevenRoundedRectangle(
          cornerRadii: .init(topLeading: 0, bottomLeading: 20, bottomTrailing: 20, topTrailing: 0)
        )
      )
      .overlay {
        VStack {
          HStack {
            Text("우리집")
            Spacer()

            Image(systemName: "square.grid.2x2")
            Image(systemName: "bell")
            Image(systemName: "cart")
          }
          .padding([.leading, .trailing], 15)
          .padding(.top, 40)

          Rectangle()
            .fill(Color.white)
            .frame(width: 370, height: 40)
            .border(Color.black)
        }
      }
      .ignoresSafeArea()
  }
}

#Preview {
  TopInfoView()
}
