//
//  CheckboxToggleStyle.swift
//  Week8_Mission
//
//  Created by Jiwoong CHOI on 6/6/24.
//

import Foundation
import SwiftUI

struct CheckboxToggleStyle: ToggleStyle {
  func makeBody(configuration: Configuration) -> some View {
    HStack {
      Image(systemName: configuration.isOn ? "checkmark.square" : "square")
        .onTapGesture {
          configuration.isOn.toggle()
        }
    }
  }
}
