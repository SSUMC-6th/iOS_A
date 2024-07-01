//
//  iOS_study_week10_testApp.swift
//  iOS_study_week10_test
//
//  Created by 김의정 on 6/30/24.
//

import SwiftUI

@main
struct iOS_study_week10_testApp: App {
    @StateObject var vm: AuthViewModel = AuthViewModel()
        
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
