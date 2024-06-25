//
//  LastSessionApp.swift
//  LastSession
//
//  Created by 김수민 on 6/25/24.
//

import SwiftUI

@main
struct LastSessionApp: App {
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
