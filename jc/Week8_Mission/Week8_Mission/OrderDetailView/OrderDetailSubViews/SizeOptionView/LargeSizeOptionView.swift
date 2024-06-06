//
//  LargeSizeOptionView.swift
//  Week8_Mission
//
//  Created by Jiwoong CHOI on 6/6/24.
//

import SwiftUI

struct LargeSizeOptionView: View {
  @Binding var largeSizeChecked : Bool

  var body: some View {
    HStack {
      Toggle("", isOn: self.$largeSizeChecked)
        .toggleStyle(CheckboxToggleStyle())
      Text("L")
      Spacer()
      Text("23,000원")
    }
  }
}

