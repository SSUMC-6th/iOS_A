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
                    
                    Spacer().frame(height: 50)
                
                    
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 0) {
                                ForEach(secondPosts) { post in
                                    SecondPostView(post: post)
                                }
                        }
                    }
                    .padding(.bottom)
                    
                    ScrollView {
                        VStack {
                            ForEach(posts) { post in
                                PostView(post: post)
                                    .padding(.horizontal, 10)
                            }
                        }
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
            .background(Color.orange)
            .shadow(radius: 2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
