//
//  ThreeTabsView.swift
//  Week6_Mission
//
//  Created by Jiwoong CHOI on 5/14/24.
//

import SwiftUI

struct ThreeTabsView: View {
  var body: some View {
    HStack {
      LowPriceDelivery()
      Spacer()
      DeliveryView()
      Spacer()
      StoreView()
    }.padding([.leading, .trailing], 10)
  }
}

#Preview {
  ThreeTabsView()
}
