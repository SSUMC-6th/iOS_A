//
//  BigSizeSpecialPriceTab.swift
//  Week1_Mission
//
//  Created by Jiwoong CHOI on 4/4/24.
//

import SwiftUI

struct BigSizeSpecialPriceTab: View {
    var body: some View {
        VStack {
            HStack {
                Text("대용량특가")
                Text("많이 살수록 더 저렴하죠")
            }
                        
            Text("여기 다양한 탭이 옵니다.")
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

#Preview {
    BigSizeSpecialPriceTab()
}
