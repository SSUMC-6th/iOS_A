//
//  DeliveryView.swift
//  Week6_Mission
//
//  Created by Jiwoong CHOI on 5/14/24.
//

import SwiftUI

struct DeliveryView: View {
  private let cornerRadius: CGFloat = 20
  private let size : CGFloat = 110
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: self.cornerRadius)
        .foregroundStyle(Color.white)
        .frame(width: self.size, height: self.size, alignment: .center)
        .overlay {
          VStack {
            HStack {
              Text("배달")
              Spacer()
            }
            Text("세상은 넓고 맛집은 많다")
              .font(.caption)
          }.padding()

        }

    }
  }
}

#Preview {
    DeliveryView()
}
