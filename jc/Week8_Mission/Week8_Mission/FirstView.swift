//
//  FirstView.swift
//  Week8_Mission
//
//  Created by Jiwoong CHOI on 6/2/24.
//

import SwiftUI

struct FirstView: View {
  @State private var message = "This is test message"
  
  var body: some View {
    NavigationStack {
      NavigationLink(message) {
        SecondView(message: message)
      }
    }
  }
}

#Preview {
  FirstView()
}
