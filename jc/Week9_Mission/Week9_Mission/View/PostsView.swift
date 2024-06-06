//
//  PostsView.swift
//  Week9_Mission
//
//  Created by Jiwoong CHOI on 6/2/24.
//

import SwiftUI

struct PostsView: View {
  @StateObject var koreanData : KoreanData
  
    var body: some View {
        NavigationStack {
          List(koreanData.postsItem) { item in
                Text(item.content)
            }
            .onAppear(perform: {
                APIServer.shared.fetchPostsData { postsItems in
                  self.koreanData.postsItem = postsItems
                }
            })
            .navigationTitle("Posts")
        }
    }
}
