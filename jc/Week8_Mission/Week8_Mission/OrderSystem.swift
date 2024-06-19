//
//  OrderSystem.swift
//  Week8_Mission
//
//  Created by Jiwoong CHOI on 6/6/24.
//

import Foundation

class OrderSystem : ObservableObject {
  @Published var mediumOptionChecked = false
  @Published var largeOptionChecked = false
  @Published var doughOptionChecked = false
  
  func getTotalPrice() -> Int {
    var totalPrice = 0
    
    if mediumOptionChecked {
      totalPrice += 20000
    }
    
    if largeOptionChecked {
      totalPrice += 23000
    }
    
    if doughOptionChecked {
      totalPrice += 4500
    }
    
    return totalPrice
  }
}
