//
//  iOS_study_week10App.swift
//  iOS_study_week10
//
//  Created by 김의정 on 6/28/24.
//

import SwiftUI

@main
struct iOS_study_week10App: App {
    @StateObject var vm = AuthViewModel()
    
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
