//
//  StoreView.swift
//  Week6_Mission
//
//  Created by Jiwoong CHOI on 5/14/24.
//

import SwiftUI

struct StoreView: View {
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
              Text("배민스토어")
              Spacer()
            }
            Text("배달은 지금 옵니다")
              .font(.caption)
          }.padding()

        }

    }
  }
}

#Preview {
  StoreView()
}
