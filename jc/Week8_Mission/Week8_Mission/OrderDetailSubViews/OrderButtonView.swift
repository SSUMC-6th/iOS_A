//
//  OrderButtonView.swift
//  Week8_Mission
//
//  Created by Jiwoong CHOI on 6/6/24.
//

import SwiftUI

struct OrderButtonView: View {
  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        Text("배달최소주문금액")
        Text("17,000원")
      }

      Button(
        action: {
          print("다음 페이지로 전환")
        },
        label: {
          Text("20,000원 담기")
        }
      )
      .buttonStyle(RoundedButtonStyle())
    }
  }
}

struct RoundedButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .frame(width: 180)
      .foregroundStyle(.white)
      .padding()
      .background(.mint)
      .clipShape(RoundedRectangle(cornerRadius: 10))
  }
}

#Preview {
  OrderButtonView()
}
