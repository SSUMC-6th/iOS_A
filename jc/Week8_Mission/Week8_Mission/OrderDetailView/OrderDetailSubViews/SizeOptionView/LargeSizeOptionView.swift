//
//  LargeSizeOptionView.swift
//  Week8_Mission
//
//  Created by Jiwoong CHOI on 6/6/24.
//

import SwiftUI

struct LargeSizeOptionView: View {
  @StateObject var orderSystem : OrderSystem

  var body: some View {
    HStack {
      Toggle("", isOn: self.$orderSystem.largeOptionChecked)
        .toggleStyle(CheckboxToggleStyle())
      Text("L")
      Spacer()
      Text("23,000원")
    }
  }
}

