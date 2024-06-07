//
//  BaseTextFieldStyle.swift
//  Week9_Mission
//
//  Created by Jiwoong CHOI on 6/7/24.
//

import SwiftUI

struct BaseTextFieldStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .frame(width: 300, height: 30, alignment: .center)
      .multilineTextAlignment(.center)
      .clipShape(RoundedRectangle(cornerRadius: 10))
      .border(.black)
  }
}
