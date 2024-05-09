//
//  BoredAPIModel.swift
//  TableViewWithAPI
//
//  Created by Jiwoong CHOI on 4/23/24.
//

import Foundation

struct BoredDataModel: Codable {
  var activity: String
  var type: String
  var participants: Int
  var price: Double
  var link: String
  var key: String
  var accessibility: Double
}
