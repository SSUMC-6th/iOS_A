//
//  HomeView.swift
//  Week6_Mission
//
//  Created by Jiwoong CHOI on 5/14/24.
//

import SwiftUI

struct HomeView: View {
  var body: some View {
    VStack {
      TopInfoView()

      Spacer()

      VStack {
        HStack {
          Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
          Text("Hello, world!")
            .font(.largeTitle)
        }

        Text("Glad to meet you.")
          .font(.caption)
      }
      .padding()

      Spacer()
    }
  }
}

#Preview {
  HomeView()
}
