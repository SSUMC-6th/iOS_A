//
//  ContentView.swift
//  iOS_study_week8
//
//  Created by 김의정 on 6/4/24.
//

import SwiftUI

struct ProductDetailView: View {
    var title: String
    @State private var valueToBind = 0

    var body: some View {
        Text("Selected Product: \(title)")
            .font(.largeTitle)
            .padding()
        ChildView(someValue: $valueToBind)
    }
}


struct ChildView: View {
    @Binding var someValue: Int

    var body: some View {
        VStack {
            Text("좋아요 수: \(someValue)")

            Button("Like") {
                someValue += 1
            }
        }
    }
}

