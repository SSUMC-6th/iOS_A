//
//  HorizontalScrollView.swift
//  cookie_week7
//
//  Created by 김경서 on 5/26/24.
//

import SwiftUI

struct HorizontalScrollView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack (spacing: 20) {
                ForEach(1..<21, id: \.self) { horizontalIndex in
                    VStack {
                        Image("img")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipped()
                        Text("아이템 \(horizontalIndex)")
                            .font(.system(size: 14))
                            .padding([.bottom, .horizontal])    // 텍스트 아래, 좌우에 패딩 적용
                    }
                    .frame(width: 100)
                }
            }
        }
        .frame(height: 150)
        .padding(.horizontal)
    }
}
