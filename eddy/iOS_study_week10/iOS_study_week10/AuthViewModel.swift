//
//  AuthViewModel.swift
//  iOS_study_week10
//
//  Created by 김의정 on 6/30/24.
//

import Foundation

class AuthViewModel: ObservableObject {
    @Published var loginSuccess: Bool = false
    
    func logout() {
        loginSuccess = false
        TokenManager.shared.clearTokens()
    }
}
