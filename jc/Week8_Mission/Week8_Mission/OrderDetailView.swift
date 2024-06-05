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
                    
                    VStack {
                        Text(self.menuTitle)
                        Text(self.menuDetail)
                    }
                    
                    VStack {
                        HStack {
                            Text("가격")
                            Spacer()
                            Text("필수")
                        }
                        
                        HStack {
                            
                            Text("M")
                            Text("20,000원")
                        }
                        
                        HStack {
                            Text("L")
                            Text("23,000원")
                        }
                    }
                    
                    VStack {
                        HStack {
                            VStack {
                                Text("도우변경")
                                Text("최대 1개 선택")
                            }
                            Spacer()
                            Text("선택")
                        }
                        
                        
                        HStack {
                            Text("크림리치골드 크러스트")
                            Text("+4500원")
                        }
                    }
                    
                }
            }
            
            HStack {
                VStack(alignment: .leading) {
                    Text("배달최소주문금액")
                    Text("17,000원")
                }
                
                Button(action: {
                    print("다음 페이지로 전환")
                }, label: {
                    Text("20,000원 담기")
                })
                .buttonStyle(RoundedButtonStyle())
            }
        }
        .ignoresSafeArea(edges: [.top, .leading, .trailing])
    }
}

struct RoundedButtonStyle : ButtonStyle {
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
