//
//  PostView.swift
//  baki_week7
//
//  Created by 박희민 on 5/27/24.
//

import SwiftUI

let posts = [
    Post(title: "에어팟",
         locate: "서울특별시 동작구",
         price: "",
         imageName: "air", 
         reservation: "",
         comments: 0,
         likes: 0),
    Post(title: "에어팟 맥스 실버",
         locate: "서울특별시 양천구 · 6일 전",
         price: "370,000원",
         imageName: "airmax",
         reservation: "예약중",
         comments: 5,
         likes: 23),
    Post(title: "에어팟 맥스 스페이스 그레이 S급 판매합니다.",
         locate: "서울특별시 양천구 · 3시간 전",
         price: "490,000원",
         imageName: "airmax2",
         reservation: "",
         comments: 1,
         likes: 4),
    Post(title: "바키",
         locate: "천안시 서북구 쌍용동 · 1일 전",
         price: "1221원",
         imageName: "my",
         reservation: "예약완료",
         comments: 12,
         likes: 21)
]

struct PostView: View {
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(post.imageName)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                    .padding(.trailing, 10)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(post.title)
                        .font(.system(size: 16, weight: .bold))
                    Text(post.locate)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    HStack {
                        if !post.reservation.isEmpty {
                            Text(post.reservation)
                                .font(.system(size: 14))
                                .foregroundColor(.green)
                        }
                        Text(post.price)
                            .font(.system(size: 14, weight: .bold))
                    }
                }
                Spacer()
            }
            .padding()
            
            HStack {
                Spacer()
                HStack(spacing: 5) {
                    Image(systemName: "message")
                    Text("\(post.comments)")
                    Image(systemName: "heart")
                    Text("\(post.likes)")
                }
                .font(.system(size: 12))
                .foregroundColor(.gray)
            }
            .padding(.horizontal)
        }
        .background(Color.white)
        .cornerRadius(15.0)
        .shadow(radius: 2)
        .padding(.vertical, 5)
    }
}
