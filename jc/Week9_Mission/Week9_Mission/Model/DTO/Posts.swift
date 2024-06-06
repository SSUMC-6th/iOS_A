//
//  Posts.swift
//  Week9_Mission
//
//  Created by Jiwoong CHOI on 6/2/24.
//

import Foundation

struct Posts: Codable, Identifiable {
  let id: Int
  let title: String
  let content: String
  let createdAt: String
  let updatedAt: String
  let UserId: Int
}
