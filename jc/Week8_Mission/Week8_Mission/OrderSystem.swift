//
//  OrderSystem.swift
//  Week8_Mission
//
//  Created by Jiwoong CHOI on 6/6/24.
//

import Foundation

class OrderSystem : ObservableObject {
  @Published private var sizeOption : String
  @Published private var doughOption : String
  
  init(sizeOption: String, doughOption: String) {
    self.sizeOption = sizeOption
    self.doughOption = doughOption
  }
}
