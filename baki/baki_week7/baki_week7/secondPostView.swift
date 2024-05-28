//
//  secondPostView.swift
//  baki_week7
//
//  Created by 박희민 on 5/27/24.
//

import SwiftUI

let secondPosts = [
    SecondPost(title: "에어팟", imageName: "air"),
    SecondPost(title: "에어팟", imageName: "air"),
    SecondPost(title: "에어팟", imageName: "air"),
    SecondPost(title: "에어팟", imageName: "air"),
    SecondPost(title: "에어팟", imageName: "air")
]

struct SecondPostView: View {
    let post: SecondPost
    var body: some View {
        
        VStack {
                        Image(post.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                        Text(post.title)
                            .font(.system(size: 16, weight: .bold))
                    }
                    .frame(width: 150, height: 150)
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 3)
                    .padding(.leading)
                
            
        }
    
}

#Preview {
    SecondPostView(post: secondPosts[0]) 
}
