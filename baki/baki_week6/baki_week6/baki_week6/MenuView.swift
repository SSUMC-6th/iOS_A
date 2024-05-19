//
//  MenuView.swift
//  baki_week6
//
//  Created by 박희민 on 5/20/24.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 300, height: 300)
                .foregroundColor(.green)
            
            Text("\(4)")
                .font(.system(size: 70))
                .foregroundColor(.white)
                .fontWeight(.bold)
        }
    }
}

#Preview {
    MenuView()
}
