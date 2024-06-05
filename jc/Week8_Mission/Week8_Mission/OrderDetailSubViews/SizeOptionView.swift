//
//  SizeOptionView.swift
//  Week8_Mission
//
//  Created by Jiwoong CHOI on 6/6/24.
//

import SwiftUI

struct SizeOptionView: View {
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

      HStack {
        Text("M")
        Spacer()
        Text("20,000원")
      }

      HStack {
        Text("L")
        Spacer()
        Text("23,000원")
      }
    }
    .padding()
  }
}

#Preview {
  SizeOptionView()
}
