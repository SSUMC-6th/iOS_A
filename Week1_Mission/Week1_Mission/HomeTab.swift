//
//  HomeTab.swift
//  Week1_Mission
//
//  Created by Jiwoong CHOI on 4/6/24.
//

import SwiftUI

struct HomeTab: View {
    var body: some View {
        VStack {
            SearchAndToolTab()
            
            CouponBanner()
            
            HStack {
                Spacer()
                LowPriceDeliveryTab()
                Spacer()
                DeliveryTab()
                Spacer()
                BaeminStoreTab()
                Spacer()
            }
            
            BigSizeSpecialPriceTab()
            
            AdBanner()
            
            Spacer()
        }
        .background(.gray.opacity(0.2)).ignoresSafeArea()   
    }
}

#Preview {
    HomeTab()
}
