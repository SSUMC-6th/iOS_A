//
//  ContentView.swift
//  baki_week8
//
//  Created by 박희민 on 6/3/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedSize = "M"
    @State private var isGoldCrust = false

    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack {
                        Image("pizza")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                            .frame(height: 300)
                            .clipped()
                        
                        SelectView(selectedSize: $selectedSize, isGoldCrust: $isGoldCrust)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(15)
                            .shadow(radius: 5)
                            .padding(.top, -20)
                    }
                }
                
                // 담기 버튼
                NavigationLink(destination: OrderView(selectedSize: selectedSize, isGoldCrust: isGoldCrust)) {
                    Text("\(calculateTotalPrice())원 담기")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.mint)
                        .cornerRadius(10)
                        .padding(.top, 20)
                }
                .padding([.leading, .trailing, .bottom])
            }
        }
    }
    
    func calculateTotalPrice() -> Int {
        let basePrice = selectedSize == "M" ? 20000 : 23000
        let crustPrice = isGoldCrust ? 4500 : 0
        return basePrice + crustPrice
    }
}

#Preview {
    ContentView()
}
