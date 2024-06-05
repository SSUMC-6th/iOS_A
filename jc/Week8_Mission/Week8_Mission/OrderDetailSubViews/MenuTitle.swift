//
//  MenuTitle.swift
//  Week8_Mission
//
//  Created by Jiwoong CHOI on 6/6/24.
//

import SwiftUI

struct MenuTitle: View {
  @Binding var menuTitle: String
  @Binding var menuDetail: String

  var body: some View {
    VStack(alignment: .leading) {
      Text(self.menuTitle)
        .font(.title)
        .bold()
      Text(self.menuDetail)
        .foregroundStyle(.gray)

      Text("영양성분 및 알레르기성분 표시 보기")
        .font(.caption)
        .padding(5)
        .background(
          RoundedRectangle(cornerRadius: 5)
            .fill(.gray.opacity(0.3))
        )
    }
  }
}
