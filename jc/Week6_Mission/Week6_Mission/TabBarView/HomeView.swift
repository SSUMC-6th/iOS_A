//
//  HomeView.swift
//  Week6_Mission
//
//  Created by Jiwoong CHOI on 5/14/24.
//

import SwiftUI

struct HomeView: View {
  var body: some View {
    ZStack {
      Color.gray.opacity(0.2).ignoresSafeArea()
      
      VStack {
        TopInfoView()
        
        Spacer()
        
        CouponBannerView()
        
        Spacer()
        
        ThreeTabsView()
        
        Spacer()
        
        BigSaleView()
        
        Spacer()
        
        AdBannerView()
        
        Spacer()
      }
    }
  }
}

#Preview {
  HomeView()
}
