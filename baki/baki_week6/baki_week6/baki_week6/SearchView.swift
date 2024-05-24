//
//  SearchView.swift
//  baki_week6
//
//  Created by 박희민 on 5/20/24.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 300, height: 300)
                .foregroundColor(.green)
            
            Text("\(2)")
                .font(.system(size: 70))
                .foregroundColor(.white)
                .fontWeight(.bold)
        }
    }
}

#Preview {
    SearchView()
}
