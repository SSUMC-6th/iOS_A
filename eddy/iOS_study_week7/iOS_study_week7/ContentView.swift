//
//  ContentView.swift
//  iOS_study_week7
//
//  Created by 김의정 on 5/27/24.
//


import SwiftUI

struct ContentView: View {
    let radomNumber = Int.random(in: 0..<productData.count)
    
    var body: some View {
        TabView {
            NavigationView {
                ScrollView {
                    ForEach(productData.indices, id: \.self) { index in
                        VStack {
                            // ProductView를 먼저 추가
                            ProductView(product: productData[index])

                            // 랜덤 인덱스에 대해 수평 스크롤 뷰 추가
                            if index == Int.random(in: 0..<productData.count) {
                                HorizontalScrollView()
                            }
                        }
                    }
                }
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("홈")
            }

            Text("동네생활")
                .tabItem {
                    Image(systemName: "bubble.left.and.bubble.right.fill")
                    Text("동네생활")
                }

            Text("내 근처")
                .tabItem {
                    Image(systemName: "location.fill")
                    Text("내 근처")
                }

            Text("채팅")
                .tabItem {
                    Image(systemName: "message.fill")
                    Text("채팅")
                }

            Text("나의 당근")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("나의 당근")
                }
        }
    }
}

#Preview {
    ContentView()
}

