//
//  baki_week10App.swift
//  baki_week10
//
//  Created by 박희민 on 6/29/24.
//

import SwiftUI

@main
struct baki_week10App: App {
    @StateObject var vm: authViewModel = authViewModel()
    
    var body: some Scene {
        WindowGroup() {
            if (vm.loginSuccess || TokenManager.shared.isAutoLogin ?? false) && !TokenManager.shared.isRefreshTokenExpired() {
                HomeView()
            } else {
                LoginView()
            }
        }.environmentObject(vm)
    }
}
