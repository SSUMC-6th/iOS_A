//
//  Comments.swift
//  Week9_Mission
//
//  Created by Jiwoong CHOI on 6/2/24.
//

import Foundation

struct User: Codable {
  let name: String
  let username: String
  let email: String
}

struct Post: Codable {
  let id: Int
  let title: String
  let content: String
  let createdAt: String
  let updatedAt: String
  let UserId: Int
}

struct Comments: Codable, Identifiable {
  let id: Int
  let content: String
  let createdAt: String
  let updatedAt: String
  let UserId: Int
  let PostId: Int
  let User: User
  let Post: Post
}
