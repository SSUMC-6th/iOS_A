//
//  OrderButtonView.swift
//  Week8_Mission
//
//  Created by Jiwoong CHOI on 6/6/24.
//

import SwiftUI

struct OrderButtonView: View {
  @Binding var mediumOptionChecked : Bool
  @Binding var largeOptionChecked : Bool
  @Binding var doughOptionChecked : Bool

  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        Text("배달최소주문금액")
        Text("17,000원")
      }

      Button(
        action: {
          print("다음 페이지로 전환")
        },
        label: {
          Text("\(totalPrice())원 담기")
        }
      )
      .buttonStyle(RoundedButtonStyle())
    }
  }
  
  private func totalPrice() -> Int {
    var totalPrice = 0
   
    if self.mediumOptionChecked {
      totalPrice += 20000
    }
    
    if self.largeOptionChecked {
      totalPrice += 23000
    }
    
    if self.doughOptionChecked {
      totalPrice += 4500
    }
    
    return totalPrice
  }
}
