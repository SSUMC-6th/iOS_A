//
//  CommentsView.swift
//  Week9_Mission
//
//  Created by Jiwoong CHOI on 6/2/24.
//

import SwiftUI

struct CommentsView: View {
  @StateObject var koreanData : KoreanData
  
    var body: some View {
        NavigationStack {
          List(koreanData.commentsItem) { item in
                Text(item.content)
            }
            .onAppear(perform: {
                APIServer.shared.fetchCommentsData { commentsItem in
                  DispatchQueue.main.async {
                    self.koreanData.commentsItem = commentsItem
                  }
                }
            })
            .navigationTitle("Comments")
        }
    }
}
