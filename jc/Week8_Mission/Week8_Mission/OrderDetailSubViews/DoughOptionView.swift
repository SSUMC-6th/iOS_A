//
//  DoughOptionView.swift
//  Week8_Mission
//
//  Created by Jiwoong CHOI on 6/6/24.
//

import SwiftUI

struct DoughOptionView: View {
    var body: some View {
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

#Preview {
    DoughOptionView()
}
