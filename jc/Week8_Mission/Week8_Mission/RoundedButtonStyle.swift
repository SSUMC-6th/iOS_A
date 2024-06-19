//
//  RoundedButtonStyle.swift
//  Week8_Mission
//
//  Created by Jiwoong CHOI on 6/6/24.
//

import Foundation
import SwiftUI

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
