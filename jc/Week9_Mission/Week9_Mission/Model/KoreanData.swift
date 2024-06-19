//
//  KoreanData.swift
//  Week9_Mission
//
//  Created by Jiwoong CHOI on 6/6/24.
//

import Foundation

class KoreanData: ObservableObject {
  @Published var usersItem: [Users] = []
  @Published var postsItem: [Posts] = []
  @Published var todosItem: [Todos] = []
  @Published var commentsItem: [Comments] = []
}
