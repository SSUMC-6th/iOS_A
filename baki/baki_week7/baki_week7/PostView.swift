//
//  PostView.swift
//  baki_week7
//
//  Created by 박희민 on 5/27/24.
//

import SwiftUI

//테스트용 영화 정보
let posts = [
    Post(title: "air", things:"에어팟",name:"air.jpeg"),
    Post(title: "air", things:"맥북",name:"air.jpeg"),
    Post(title: "air", things:"아이폰",name:"air.jpeg"),
]

struct PostView: View {
    let post : Post
    var body: some View {
        VStack {
            HStack{
                Image(systemName: "Star")
                                    .resizable()
                                    
                VStack(alignment: .center) {
                    Text(post.title)
                        .font(.system(size: 16, weight: .bold))
                    HStack {
                        Text("물품명: \(post.things)")
                            .font(.system(size: 12, weight: .light))
                    }
                    Spacer()
                }.padding(.top, 10)
                    
                //.padding()
            }
        }
        .frame(height: 150)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.orange, Color.yellow]), startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .foregroundColor(.white)
        .cornerRadius(15.0)
    }
}

