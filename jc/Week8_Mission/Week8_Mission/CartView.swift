//
//  CartView.swift
//  Week8_Mission
//
//  Created by Jiwoong CHOI on 6/6/24.
//

import SwiftUI

struct CartView: View {
  @StateObject var orderSystem : OrderSystem
  
    var body: some View {
      VStack {
        Text("\(orderSystem.getTotalPrice())를 결제하세요.")
      }
    }
}

