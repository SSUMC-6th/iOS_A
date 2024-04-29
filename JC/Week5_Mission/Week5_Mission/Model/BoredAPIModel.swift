//
//  BoredAPIModel.swift
//  TableViewWithAPI
//
//  Created by Jiwoong CHOI on 4/23/24.
//

import Foundation

struct BoredAPIModel: Decodable {
  var activity: String = ""
  var type: String = ""
  var participants: Int = 0
  var price: Double = 0.0
  var link: String = ""
  var key: String = ""
  var accessibility: Double = 0.0
}
