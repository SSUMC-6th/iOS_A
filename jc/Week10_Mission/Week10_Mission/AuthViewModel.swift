//
//  AuthViewModel.swift
//  Week10_Mission
//
//  Created by Jiwoong CHOI on 6/26/24.
//

import Foundation
import Moya
import Security
import SwiftUI

class AuthViewModel: ObservableObject {
  // MARK: - Properties

  @AppStorage("isLoggedIn") var isLoggedIn = false
  @Published var username: String = ""
  private let authProvider = MoyaProvider<AuthMoyaTargetType>()

  // MARK: - Public Methods

  public func signup(id: String, password: String) {
    self.authProvider.request(.signup(id: id, password: password)) { result in
      switch result {
      case let .success(moyaResponse):
        let data = moyaResponse.data
        do {
          let signupResponse = try JSONDecoder().decode(SignupResponseDTO.self, from: data)
          debugPrint("Username : \(signupResponse.username)")
          debugPrint("Message : \(signupResponse.message)")
        } catch {
          debugPrint("Some error occured in sign up")
        }
      case let .failure(moyaError):
        debugPrint(moyaError.localizedDescription)
      }
    }
  }

  public func login(id: String, password: String) {
    self.authProvider.request(.login(id: id, password: password)) { result in
      switch result {
      case let .success(moyaResponse):
        let data = moyaResponse.data
        do {
          let tokenResponse = try JSONDecoder().decode(LoginResponseDTO.self, from: data)
          debugPrint("Access Token : \(tokenResponse.access_token)")
          debugPrint("Refresh Token : \(tokenResponse.refresh_token)")
          self.storeToken(accessToken: tokenResponse.access_token, refreshToken: tokenResponse.refresh_token)
        } catch {
          debugPrint("Some error occured in login")
        } case let .failure(moyaError):
        debugPrint(moyaError.localizedDescription)
      }
    }
  }

  public func signout() {
    self.deleteToken()
  }
  
  public func getUserAccessToken() -> String {
    if let accessToken = UserDefaults.standard.string(forKey: "accessToken") {
      return accessToken
    } else {
      return "No Access Token"
    }
  }
  
  public func getUserRefreshToken() -> String {
    if let refreshToken = UserDefaults.standard.string(forKey: "refreshToken") {
      return refreshToken
    } else {
      return "No Refresh Token"
    }
  }

  // MARK: - Private Methods

  private func storeToken(accessToken: String, refreshToken: String) {
    UserDefaults.standard.setValue(accessToken, forKey: "accessToken")
    UserDefaults.standard.setValue(refreshToken, forKey: "refreshToken")
  }

  private func deleteToken() {
    UserDefaults.standard.removeObject(forKey: "accessToken")
    UserDefaults.standard.removeObject(forKey: "refreshToken")
  }
}
