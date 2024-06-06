//
//  DoughOptionView.swift
//  Week8_Mission
//
//  Created by Jiwoong CHOI on 6/6/24.
//

import SwiftUI

struct DoughOptionView: View {
  @Binding var doughOptionChecked : Bool
  
  var body: some View {
    VStack {
      HStack {
        VStack(alignment: .leading) {
          Text("도우변경")
            .font(.title2)
            .bold()
          Text("최대 1개 선택")
            .font(.caption)
        }
        Spacer()
        Text("선택")
          .font(.caption)
          .foregroundStyle(.gray)
          .padding([.top, .bottom], 5)
          .padding([.leading, .trailing], 7)
          .background(
            RoundedRectangle(cornerRadius: 15)
              .fill(.gray.opacity(0.1))
          )
      }

      HStack {
        Toggle("", isOn: self.$doughOptionChecked)
          .toggleStyle(CheckboxToggleStyle())
        Text("크림리치골드 크러스트")
        Spacer()
        Text("+4500원")
      }
    }
    .padding()
  }
}
