//
//  AuthViewModel.swift
//  LastSession
//
//  Created by 김수민 on 6/25/24.
//

import Foundation

class AuthViewModel: ObservableObject {
    @Published var loginSuccess: Bool = false
    
    func logout() {
        loginSuccess = false
        TokenManager.shared.clearTokens()
    }
}
