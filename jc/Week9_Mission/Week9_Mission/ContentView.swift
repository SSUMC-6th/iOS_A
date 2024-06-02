//
//  ContentView.swift
//  Week9_Mission
//
//  Created by Jiwoong CHOI on 6/2/24.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    TabView {
      UserView()
        .tabItem {
          Image(systemName: "person")
          Text("Users")
        }
      
      PostsView()
        .tabItem {
          Image(systemName: "list.clipboard")
          Text("Posts")
        }
      TodosView()
        .tabItem {
          Image(systemName: "checklist")
          Text("Todos")
        }
      CommentsView()
        .tabItem {
          Image(systemName: "text.bubble")
          Text("Comments")
        }
    }
    .tint(.black)
  }
}

#Preview {
  ContentView()
}
