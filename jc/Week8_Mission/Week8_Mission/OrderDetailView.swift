//
//  OrderDetailView.swift
//  Week8_Mission
//
//  Created by Jiwoong CHOI on 6/6/24.
//

import SwiftUI

struct OrderDetailView: View {
    @State var menuTitle : String = "[재주문1위] 바싹 불고기 피자"
    @State var menuDetail : String = "바싹 익힌 불고기의 풍미를 입안 가득 느낄 수 있는 자기제빵선명희피자의 야심작"
        
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    Image("pizza")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    MenuTitle(menuTitle: self.$menuTitle, menuDetail: self.$menuDetail)
                    
                    SizeOptionView()
                    
                    DoughOptionView()
                }
            }
            
            OrderButtonView()
        }
        .ignoresSafeArea(edges: [.top, .leading, .trailing])
    }
}

struct RoundedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 180)
            .foregroundStyle(.white)
            .padding()
            .background(.mint)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    OrderDetailView()
}
