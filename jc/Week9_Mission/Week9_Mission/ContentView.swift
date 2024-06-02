//
//  ContentView.swift
//  Week9_Mission
//
//  Created by Jiwoong CHOI on 6/2/24.
//

import SwiftUI

struct ContentView: View {
  private let baseURL: String = "https://koreanjson.com/"
  @State private var items : [Users] = []

  var body: some View {
    NavigationStack {
      List(items) { item in
        VStack {
          Text(item.name)
        }
      }
      .onAppear(perform: {
        fetchData()
      })
      .navigationTitle("Sample Korean")
    }
  }

  private func fetchData() {
    guard let url = URL(string: baseURL + "users") else {
      return
    }

    URLSession.shared.dataTask(with: url) { data, _, _ in
      guard let data = data else {
        debugPrint("No data received...!")
        return
      }
      
      do {
        let items = try JSONDecoder().decode([Users].self, from: data)
        
        DispatchQueue.main.async {
          self.items = items
        }
        
      } catch {
        debugPrint("Something errors in Encoding...!")
      }
    }.resume()
  }
}

#Preview {
  ContentView()
}
