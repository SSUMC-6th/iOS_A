//
//  SearchAndToolTab.swift
//  Week1_Mission
//
//  Created by Jiwoong CHOI on 4/4/24.
//

import SwiftUI

struct SearchAndToolTab: View {
    var body: some View {
        VStack {
            HStack {
                Text("우리집")
                Image(systemName: "list.number")
                
                Spacer()
                
                Image(systemName: "qrcode")
                Image(systemName: "bell")
                Image(systemName: "cart")
            }
            .foregroundStyle(.white)
            .padding()
            
            HStack {
                Image(systemName: "magnifyingglass")
                Text("찾는 맛집 이름이 뭐예요?")
                Spacer()
            }
            .padding()
            .background(.white)
            .clipShape(Rectangle())
        }
        .padding(EdgeInsets(top: 50, leading: 20, bottom: 20, trailing: 10))
        .background(.mint)
        .clipShape(UnevenRoundedRectangle(topLeadingRadius: 0, bottomLeadingRadius: 25, bottomTrailingRadius: 25, topTrailingRadius: 0, style: .circular))
    }
}

#Preview {
    SearchAndToolTab()
}
