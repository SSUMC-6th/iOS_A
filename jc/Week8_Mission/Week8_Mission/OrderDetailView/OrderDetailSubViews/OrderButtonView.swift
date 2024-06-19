//
//  OrderButtonView.swift
//  Week8_Mission
//
//  Created by Jiwoong CHOI on 6/6/24.
//

import SwiftUI

struct OrderButtonView: View {
  @StateObject var orderSystem: OrderSystem
  
  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        Text("배달최소주문금액")
        Text("17,000원")
      }
      
      NavigationLink("\(self.orderSystem.getTotalPrice())원 담기", destination: CartView(orderSystem: self.orderSystem))
        .buttonStyle(RoundedButtonStyle())
    }
  }
}
