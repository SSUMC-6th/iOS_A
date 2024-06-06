//
//  MediumSizeOption.swift
//  Week8_Mission
//
//  Created by Jiwoong CHOI on 6/6/24.
//

import SwiftUI

struct MediumSizeOptionView: View {
  @Binding var mediumSizeChecked : Bool

  var body: some View {
    HStack {
      Toggle("", isOn: self.$mediumSizeChecked)
        .toggleStyle(CheckboxToggleStyle())
      Text("M")
      Spacer()
      Text("20,000원")
    }
  }
}
