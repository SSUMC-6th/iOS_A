//
//  Todos.swift
//  Week9_Mission
//
//  Created by Jiwoong CHOI on 6/2/24.
//

import Foundation

struct Todos: Codable, Identifiable {
    let id: Int
    let title: String
    let completed: Bool
    let createdAt: String
    let updatedAt: String
    let UserId: Int
}
