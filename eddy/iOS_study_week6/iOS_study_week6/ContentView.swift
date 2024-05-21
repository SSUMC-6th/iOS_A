//
//  ContentView.swift
//  iOS_study_week6
//
//  Created by 김의정 on 5/21/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // 전체 뷰에 대한 배경색을 빨간색으로 지정하고, safe area까지 확장합니다.
        ZStack {
            Color.backgroundgray
                .edgesIgnoringSafeArea(.all) // safe area까지 빨간 배경 적용
            
            VStack(spacing: 0) {
                BannerView()
                    .frame(height: 160)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .background(Color.topbanner) // 배너 뷰의 배경색을 파란색으로 지정
                    .cornerRadius(20) // 필요에 따라 모서리 둥글기 적용
                    .edgesIgnoringSafeArea(.top) // 상단 safe area까지 파란 배경 적용
                
                Image("광고1")
                    .resizable() // 이미지의 크기 조정 가능하게 함
                    .aspectRatio(contentMode: .fit) // 종횡비 유지
                    .frame(width: 360) // .resizable()과 함께 쓰임
                    .padding(.top, -40) // 기본 간격이 그냥 넓은건가??
    
                // 버튼 1, 2, 3
                HStack(spacing: 5) {
                    Image("버튼1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height: 120)
                    Image("버튼3")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height: 120)
                    Image("버튼2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height: 120)
                }
                .padding(.top, 15)
    
                // 리스트 이미지
                Image("리스트")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 360)
                    .padding(.top, 15)
    
                // 광고 이미지 2
                Image("광고2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 360)
                    .padding(.horizontal, 15)
                    .padding(.top, 15)
                
                Spacer() // 나머지 공간을 채우기 위해 Spacer 사용
            }
        }
    }
}

struct BannerView: View {
    var body: some View {
        // 배너 뷰의 내용을 여기에 추가합니다.
        ZStack {
            VStack {
                Spacer()
                Image("검색바")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 380)
                    .padding(.bottom, 10)
            }
        }
    }
}

#Preview {
    ContentView()
}
