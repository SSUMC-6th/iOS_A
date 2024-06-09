//
//  AuthViewModel.swift
//  Week9_Mission
//
//  Created by Jiwoong CHOI on 6/7/24.
//

import FirebaseAuth
import Foundation

class AuthViewModel: ObservableObject {
  @Published private var currentUser: FirebaseAuth.User? = Auth.auth().currentUser

  func getCurrentUserEmail() -> String {
    if let currentUser = self.currentUser, let email = currentUser.email {
      return email
    } else {
      return "NO EMAIL"
    }
  }
}
