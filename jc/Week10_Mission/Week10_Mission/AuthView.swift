//
//  ContentView.swift
//  Week10_Mission
//
//  Created by Jiwoong CHOI on 6/26/24.
//

import SwiftUI

struct AuthView: View {
  @EnvironmentObject var authViewModel : AuthViewModel
  
  @State var id: String = ""
  @State var password: String = ""
  @State private var showAlert = false
  @State private var alertMessage = ""
  @State private var isLoginAction = false

  var body: some View {
    VStack {
      TextField("User ID", text: self.$id)
        .padding()
        .border(Color.black)
      
      SecureField("User Password", text: self.$password)
        .padding()
        .border(Color.black)
      
      HStack {
        Button("Log In") {
          self.authViewModel.login(id: self.id, password: self.password)
          self.alertMessage = "Log In Successful"
          self.isLoginAction = true
          self.showAlert = true
        }
        .buttonStyle(.bordered)
        .padding()
        Button("Sign Up") {
          self.authViewModel.signup(id: self.id, password: self.password)
          self.alertMessage = "Sign Up Successful"
          self.isLoginAction = false
          self.showAlert = true
        }
        .padding()
        .buttonStyle(.bordered)
      }
      .padding()
    }
    .padding()
    .alert("Success", isPresented: $showAlert) {
      Button("OK", role: .cancel) { 
        if self.isLoginAction {
          self.authViewModel.isLoggedIn = true
        }
      }
    } message: {
      Text(alertMessage)
    }
  }
}

#Preview {
  AuthView()
}
