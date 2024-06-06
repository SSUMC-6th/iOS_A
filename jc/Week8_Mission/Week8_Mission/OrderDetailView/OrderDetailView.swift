//
//  OrderDetailView.swift
//  Week8_Mission
//
//  Created by Jiwoong CHOI on 6/6/24.
//

import SwiftUI

struct OrderDetailView: View {
  @State private var menuTitle: String = "[재주문1위] 바싹 불고기 피자"
  @State private var menuDetail: String = "바싹 익힌 불고기의 풍미를 입안 가득 느낄 수 있는 자기제빵선명희피자의 야심작"
  
  @State private var mediumSizeChecked = false
  @State private var largeSizeChecked = false
  @State private var doughOptionChecked = false
  
  var body: some View {
    NavigationStack {
      VStack {
        ScrollView {
          VStack {
            Image("pizza")
              .resizable()
              .aspectRatio(contentMode: .fit)

            MenuTitle(menuTitle: self.$menuTitle, menuDetail: self.$menuDetail)

            Rectangle()
              .fill(.gray.opacity(0.2))

            SizeOptionView(mediumSizeChecked: self.$mediumSizeChecked, largeSizeChecked: self.$largeSizeChecked)

            Rectangle()
              .fill(.gray.opacity(0.2))

            DoughOptionView(doughOptionChecked: self.$doughOptionChecked)
          }
        }

        OrderButtonView(mediumOptionChecked: self.$mediumSizeChecked, largeOptionChecked: self.$largeSizeChecked, doughOptionChecked: self.$doughOptionChecked)
      }
      .toolbar {
        ToolbarItemGroup {
          HStack {

            Button(
              action: { print("Go to Home") },
              label: {
                Image(systemName: "house")
              })

            Button(
              action: { print("Go to share") },
              label: {
                Image(systemName: "square.and.arrow.up")
              })

            Button(
              action: { print("Go to cart") },
              label: {
                Image(systemName: "cart")
              })
          }
          .foregroundStyle(.black)
        }
      }
    }
    .ignoresSafeArea(edges: [.top, .leading, .trailing])
  }
}

#Preview {
  OrderDetailView()
}
