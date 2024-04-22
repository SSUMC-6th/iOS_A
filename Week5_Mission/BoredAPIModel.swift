//
//  BoredAPIModel.swift
//  UIKitSample
//
//  Created by Jiwoong CHOI on 4/22/24.
//

import Foundation

struct BoredAPIModel: Decodable {
    let activity: String
    let type: String
    let participants: Int
    let price: Double
    let link: String
    let key: String
    let accessibility: Double
}
