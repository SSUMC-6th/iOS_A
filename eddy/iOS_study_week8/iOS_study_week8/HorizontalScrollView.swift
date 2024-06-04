//
//  HorizontalScrollView.swift
//  iOS_study_week8
//
//  Created by 김의정 on 6/4/24.
//

import SwiftUI

struct HorizontalScrollView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(0..<10) { index in
                    VStack {
                        Image(systemName: "photo")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)

                        Text("Photo \(index)")
                            .font(.headline)
                    }
                    .background(Color.orange.opacity(0.1))
                    .cornerRadius(10)
                }
            }
        }
        .frame(height: 160)
    }
}
