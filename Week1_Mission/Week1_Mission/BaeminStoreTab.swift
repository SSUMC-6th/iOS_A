//
//  BaeminStoreTab.swift
//  Week1_Mission
//
//  Created by Jiwoong CHOI on 4/4/24.
//

import SwiftUI

struct BaeminStoreTab: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("배민스토어")
            Text("배달은 지금")
            Text("옵니다")
        }
        .frame(width: 70, height: 70, alignment: .center)
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

#Preview {
    BaeminStoreTab()
}
