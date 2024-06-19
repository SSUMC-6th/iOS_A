//
//  AuthViewModel.swift
//  Week9_Mission
//
//  Created by Jiwoong CHOI on 6/7/24.
//

import FirebaseAuth
import Foundation

class AuthViewModel: ObservableObject {
  @Published var currentUser: FirebaseAuth.User?

  init() {
    self.currentUser = Auth.auth().currentUser
  }

  func getCurrentUserEmail() -> String {
    if let currentUser = self.currentUser, let email = currentUser.email {
      return email
    } else {
      return "NO EMAIL"
    }
  }
}
