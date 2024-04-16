//
//  ContentView.swift
//  Week1_Mission
//
//  Created by Jiwoong CHOI on 4/4/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            SearchTab()
                .tabItem {
                    Label("검색", systemImage: "magnifyingglass")
                }
            
            WishTab()
                .tabItem {
                    Label("찜", systemImage: "heart")
                }
            
            HomeTab()
                .tabItem {
                    Label("배민", systemImage: "house")
                }
            
            OrderListTab()
                .tabItem {
                    Label("주문내역", systemImage: "list.bullet.rectangle.portrait")
                }
            
            MyPageTab()
                .tabItem {
                    Label("my배민", systemImage: "smiley")
                }
        }
    }
}

#Preview {
    ContentView()
}
