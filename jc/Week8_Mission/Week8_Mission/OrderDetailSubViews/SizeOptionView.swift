//
//  SizeOptionView.swift
//  Week8_Mission
//
//  Created by Jiwoong CHOI on 6/6/24.
//

import SwiftUI

struct SizeOptionView: View {
    var body: some View {
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
    }
}

#Preview {
    SizeOptionView()
}
