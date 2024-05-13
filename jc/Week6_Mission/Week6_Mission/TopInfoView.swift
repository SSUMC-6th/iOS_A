//
//  WidthSizeRectangle.swift
//  Week6_Mission
//
//  Created by Jiwoong CHOI on 5/14/24.
//

import SwiftUI

struct TopInfoView: View {
  var body: some View {
    GeometryReader { geometry in
      Rectangle()
        .fill(Color.mint)
        .frame(width: geometry.size.width, height: 200, alignment: .top)
        .clipShape(
          UnevenRoundedRectangle(
            cornerRadii: RectangleCornerRadii(
              topLeading: 0, bottomLeading: 30, bottomTrailing: 30, topTrailing: 0))
        )
        .ignoresSafeArea()

    }

  }
}

#Preview {
  TopInfoView()
}
