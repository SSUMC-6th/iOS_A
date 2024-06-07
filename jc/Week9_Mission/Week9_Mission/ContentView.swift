//
//  ContentView.swift
//  Week9_Mission
//
//  Created by Jiwoong CHOI on 6/2/24.
//

import SwiftUI

struct ContentView: View {
  @StateObject private var koreanData = KoreanData()

  var body: some View {
    TabView {
      UserView(koreanData: self.koreanData)
        .tabItem {
          Image(systemName: "person")
          Text("Users")
        }

      PostsView(koreanData: self.koreanData)
        .tabItem {
          Image(systemName: "list.clipboard")
          Text("Posts")
        }
      TodosView(koreanData: self.koreanData)
        .tabItem {
          Image(systemName: "checklist")
          Text("Todos")
        }
      CommentsView(koreanData: self.koreanData)
        .tabItem {
          Image(systemName: "text.bubble")
          Text("Comments")
        }
      SettingView()
        .tabItem {
          Image(systemName: "gear")
          Text("Setting")
        }
    }
  }
}

#Preview {
  ContentView()
}
