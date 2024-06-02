//
//  ContentView.swift
//  Week9_Mission
//
//  Created by Jiwoong CHOI on 6/2/24.
//

import SwiftUI

struct ContentView: View {
  @State private var items : [Users] = []

  var body: some View {
    NavigationStack {
      List(items) { item in
        VStack {
          Text(item.name)
        }
      }
      .onAppear(perform: {
        APIServer.shared.fetchData { items in
          self.items = items
        }
      })
      .navigationTitle("Sample Korean")
    }
  }

  
}

#Preview {
  ContentView()
}
