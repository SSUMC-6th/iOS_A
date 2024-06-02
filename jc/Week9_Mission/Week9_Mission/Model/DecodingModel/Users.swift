//
//  Users.swift
//  Week9_Mission
//
//  Created by Jiwoong CHOI on 6/2/24.
//

import Foundation

struct Users: Codable, Identifiable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let phone: String
    let website: String
    let province: String
    let city: String
    let district: String
    let street: String
    let zipcode: String
    let createdAt: String
    let updatedAt: String
}
