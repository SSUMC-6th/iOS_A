//
//  MainTabView.swift
//  baki_week6
//
//  Created by 박희민 on 5/20/24.
//

import SwiftUI
import SnapKit

struct MainTabView: View {
    var body: some View {
        TabView {
            baeminView()
                .tabItem {
                    Image(systemName: "house")
                }
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            HeartView()
                .tabItem {
                    Image(systemName: "heart")
                }
            MenuView()
                .tabItem {
                    Image(systemName: "list.bullet")
                }
            MyView()
                .tabItem {
                    Image(systemName: "person")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
