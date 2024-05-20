//
//  ContentView.swift
//  Week7_Mission
//
//  Created by Jiwoong CHOI on 5/20/24.
//

import SwiftUI

struct ContentView: View {
  @Environment(\.colorScheme) var colorScheme

  var body: some View {
    TabView {
      HomeView()
        .tabItem {
          VStack {
            Image(systemName: "house")
            Text("홈")
          }
        }
      OurTownView()
        .tabItem {
          VStack {
            Image(systemName: "doc")
            Text("동네생활")
          }
        }
      NearMeView()
        .tabItem {
          VStack {
            Image(systemName: "mappin.and.ellipse")
            Text("동네생활")
          }
        }
      ChattingView()
        .tabItem {
          VStack {
            Image(systemName: "message")
            Text("채팅")
          }
        }
      MyPageView()
        .tabItem {
          VStack {
            Image(systemName: "person")
            Text("채팅")
          }
        }
    }
    .tint(colorScheme == .dark ? .white : .black)
  }
}

#Preview {
  ContentView()
}
