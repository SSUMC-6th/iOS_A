//
//  MediumSizeOption.swift
//  Week8_Mission
//
//  Created by Jiwoong CHOI on 6/6/24.
//

import SwiftUI

struct MediumSizeOptionView: View {
  @StateObject var orderSystem : OrderSystem
  
  var body: some View {
    HStack {
      Toggle("", isOn: self.$orderSystem.mediumOptionChecked)
        .toggleStyle(CheckboxToggleStyle())
      Text("M")
      Spacer()
      Text("20,000원")
    }
  }
}
