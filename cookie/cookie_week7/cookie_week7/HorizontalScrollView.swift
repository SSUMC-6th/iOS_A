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
            HStack {
                ForEach(0..<20, id: \.self) { horizontalIndex in
                        Text("Item \(horizontalIndex)")
                            .frame(width: 100, height: 100)
                            .background(Color.blue)
                            .cornerRadius(10.0)
                }
            }
        }
        .frame(height: 100)
        .padding()
    }
}
