//
//  BigSaleView.swift
//  Week6_Mission
//
//  Created by Jiwoong CHOI on 5/14/24.
//

import SwiftUI

struct BigSaleView: View {
  private let cornerRadius: CGFloat = 20
  private struct Product: Identifiable {
    let name: String

    var id: String {
      name
    }
  }

  private let productData: [Product] = [
    Product(name: "Test1"),
    Product(name: "Test2"),
    Product(name: "Test3"),
    Product(name: "Test4"),
    Product(name: "Test5"),
  ]

  var body: some View {
    RoundedRectangle(cornerRadius: self.cornerRadius)
      .foregroundColor(.white)
      .overlay(content: {
        VStack {
          HStack {
            Text("대용량특가")
              .font(.title)
            Text("많이 살수록 더 저렴하죠")
            Spacer()
            Image(systemName: "arrow.forward")
          }
          .padding()

          HStack {
            Spacer()
            ForEach(productData) { data in
              Text(data.name)
              Spacer()
            }
          }
          .padding()

          HStack {
            Spacer()
            ForEach(productData) { data in
              Text(data.name)
              Spacer()
            }
          }
          .padding()

        }
      })
      .padding(10)
  }
}

#Preview {
  BigSaleView()
}
