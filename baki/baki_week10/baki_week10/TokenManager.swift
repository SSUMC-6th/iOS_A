//
//  TokenManager.swift
//  baki_week10
//
//  Created by 박희민 on 6/29/24.
//

import Foundation

class TokenManager {
    static let shared = TokenManager()

    private init() { }
    
    var accessToken: String? {
        get {
            UserDefaults.standard.string(forKey: "accessToken")
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "accessToken")
        }
    }
    
    var refreshToken: String? {
        get {
            UserDefaults.standard.string(forKey: "refreshToken")
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "refreshToken")
        }
    }
    
    var isAutoLogin: Bool? {
        get {
            UserDefaults.standard.bool(forKey: "isAutoLogin")
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "isAutoLogin")
        }
    }
    
    func clearTokens() {
        UserDefaults.standard.removeObject(forKey: "accessToken")
        UserDefaults.standard.removeObject(forKey: "refreshToken")
        UserDefaults.standard.removeObject(forKey: "isAutoLogin")
    }
    
    func refreshAccessToken() {
        // access 토큰 만료되면 토큰 재발급 해주는 API 연결하기 -> 이부분은 프로젝트 진행하면서 꼭 해보세요!
    }
    
    func isRefreshTokenExpired() -> Bool {
        // refresh 토큰이 만료됐는지 확인해주는 API 연결하기 -> 이부분은 프로젝트 진행하면서 꼭 해보세요!
        return false
    }
}
