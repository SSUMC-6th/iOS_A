//
//  SettingItems.swift
//  Week9_Mission
//
//  Created by Jiwoong CHOI on 6/3/24.
//

import Foundation
import SwiftUI

struct SettingItems: Identifiable {
  let id = UUID()

  let titleString: String
  let iconString: String
  let detailType : DetailType

  init(titleString: String, iconString: String, detailType: DetailType) {
    self.titleString = titleString
    self.iconString = iconString
    self.detailType = detailType
  }
}

enum DetailType {
  case Auth
  case Type1
  case Type2
}
