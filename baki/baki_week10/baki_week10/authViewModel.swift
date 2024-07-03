//
//  authViewModel.swift
//  baki_week10
//
//  Created by 박희민 on 6/29/24.
//

import Foundation

class authViewModel: ObservableObject {
    @Published var loginSuccess: Bool = false
    
    func logout() {
        loginSuccess = false
        TokenManager.shared.clearTokens()
    }
}
