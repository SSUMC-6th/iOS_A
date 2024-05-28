//
//  ContentView.swift
//  iOS_study_week7
//
//  Created by 김의정 on 5/27/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView {
                List {
                    // Product items
                    ForEach(productData) { p in
                        ProductRow(product: p)
                    }
                    
                    // Horizontal ScrollView as the last item in the List
                    Section {
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
                .listStyle(PlainListStyle())
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("홈")
            }

            Text("동네생활")
                .tabItem {
                    Image(systemName: "bubble.left.and.bubble.right.fill")
                    Text("동네생활")
                }

            Text("내 근처")
                .tabItem {
                    Image(systemName: "location.fill")
                    Text("내 근처")
                }

            Text("채팅")
                .tabItem {
                    Image(systemName: "message.fill")
                    Text("채팅")
                }

            Text("나의 당근")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("나의 당근")
                }
        }
    }
}

// Product model
struct Product: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let location: String
    let timeAgo: String
    let price: String
    let isReserved: Bool
    let likes: Int
    let comments: Int
}

// Sample data
let productData = [
    Product(imageName: "Image1", title: "에어팟맥스실버", location: "서울특별시 양천구", timeAgo: "6일 전", price: "370,000원", isReserved: true, likes: 23, comments: 5),
    Product(imageName: "Image2", title: "에어팟 맥스 스페이스그레이 S급 판매합니다.", location: "서울특별시 양천구", timeAgo: "3시간 전", price: "490,000원", isReserved: false, likes: 4, comments: 1),
    Product(imageName: "Image3", title: "[S급]에어팟 맥스 스페이스 그레이 풀박 판매합니다.", location: "서울특별시 양천구", timeAgo: "1일 전", price: "550,000원", isReserved: false, likes: 7, comments: 1),
    Product(imageName: "Image3", title: "[S급]에어팟 맥스 스페이스 그레이 풀박 판매합니다.", location: "서울특별시 양천구", timeAgo: "1일 전", price: "550,000원", isReserved: false, likes: 7, comments: 1),
    Product(imageName: "Image3", title: "[S급]에어팟 맥스 스페이스 그레이 풀박 판매합니다.", location: "서울특별시 양천구", timeAgo: "1일 전", price: "550,000원", isReserved: false, likes: 7, comments: 1),
    Product(imageName: "Image3", title: "[S급]에어팟 맥스 스페이스 그레이 풀박 판매합니다.", location: "서울특별시 양천구", timeAgo: "1일 전", price: "550,000원", isReserved: false, likes: 7, comments: 1),
]

// Product row view
struct ProductRow: View {
    var product: Product

    var body: some View {
        HStack {
            Image(product.imageName)
                .resizable()
                .frame(width: 120, height: 120)
                .cornerRadius(8)

            VStack(alignment: .leading, spacing: 5) {
                Text(product.title)
                    .font(.headline)
                HStack {
                    Text(product.location)
                    Text("· \(product.timeAgo)")
                }
                .font(.subheadline)
                .foregroundColor(.gray)

                Text(product.price)
                    .font(.headline)
                    .foregroundColor(.black)

                if product.isReserved {
                    Text("예약중")
                        .font(.subheadline)
                        .foregroundColor(.green)
                        .padding(4)
                        .background(Color.green.opacity(0.1))
                        .cornerRadius(4)
                }

                HStack {
                    Image(systemName: "heart")
                    Text("\(product.likes)")
                    Image(systemName: "message")
                    Text("\(product.comments)")
                }
                .font(.subheadline)
                .foregroundColor(.gray)
            }
            .padding(.leading, 10)

            Spacer()
        }
        .padding(.vertical, 10)
    }
}


#Preview {
    ContentView()
}

