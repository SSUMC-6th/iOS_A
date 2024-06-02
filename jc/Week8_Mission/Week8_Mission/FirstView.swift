//
//  FirstView.swift
//  Week8_Mission
//
//  Created by Jiwoong CHOI on 6/2/24.
//

import SwiftUI

struct FirstView: View {
  @State private var isSecondViewActive = false
  
  var body: some View {
    NavigationStack {
      NavigationLink("Go To Second View") {
        SecondView()
      }
    }
  }
}

#Preview {
  FirstView()
}
