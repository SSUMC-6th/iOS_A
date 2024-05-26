//
//  ContentView.swift
//  baki_week7
//
//  Created by 박희민 on 5/26/24.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                VStack {
                    Spacer().frame(height: 60) // Space for the fixed header
                    VStack(spacing: 0) {
                        // Horizontal Scroll Content
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0..<10) { _ in
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color.white)
                                        .frame(width: 150, height: 150)
                                        .shadow(radius: 3)
                                        .padding(.leading)
                                }
                            }.padding(.horizontal)
                                .padding(.vertical)
                        }

                        VStack {
                            ForEach(posts) { post in
                                PostView(post: post)
                            }
                        }
                        .padding(.horizontal, 10)
                    }
                }
            }
            .padding(.top) 

            // Sticky Header
            VStack(spacing: 0) {
                Text("당근마켓")
                    .font(.title)
                    .padding(.vertical, 5)
            }
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .shadow(radius: 2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
