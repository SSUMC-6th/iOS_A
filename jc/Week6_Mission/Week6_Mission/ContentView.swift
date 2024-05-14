//
//  ContentView.swift
//  Week6_Mission
//
//  Created by Jiwoong CHOI on 5/14/24.
//

import SwiftUI

struct ContentView: View {

  var body: some View {
    TabView(selection: .constant(3)) {
      SearchView()
        .tag(1)
        .tabItem {
          Label("검색", systemImage: "magnifyingglass")
        }

      MyView()
        .tag(2)
        .tabItem {
          Label("찜", systemImage: "heart")
        }

      HomeView()
        .tag(3)
        .tabItem {
          Label("배민", systemImage: "circle")
        }

      OrderView()
        .tag(4)
        .tabItem {
          Label("주문내역", systemImage: "list.bullet.rectangle.portrait")
        }

      MyPageView()
        .tag(5)
        .tabItem {
          Label("my배민", systemImage: "face.smiling")
        }
    }
  }
}

#Preview {
  ContentView()
}
