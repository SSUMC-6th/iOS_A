//
//  AuthViewModel.swift
//  Week9_Mission
//
//  Created by Jiwoong CHOI on 6/7/24.
//

import Foundation

class AuthViewModel : ObservableObject {
  @Published var isAuthenticated: Bool = false
  
  @Published var emailAddress: String = ""
  @Published var password: String = ""
}
