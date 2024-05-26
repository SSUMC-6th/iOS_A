//
//  Tabview.swift
//  baki_week7
//
//  Created by 박희민 on 5/27/24.
//

import SwiftUI
import SnapKit

struct mainTabView: View {
    
    init() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = UIColor.white

        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().tintColor = UIColor.orange
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray

        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
    }
    
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("홈", systemImage: "house")
                        
                }
            
            secondView()
                .tabItem {
                    Label("당근", systemImage: "carrot.fill")
                }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        mainTabView()
    }
}

