//
//  AuthenticationView.swift
//  Week9_Mission
//
//  Created by Jiwoong CHOI on 6/7/24.
//

import FirebaseAuth
import FirebaseCore
import SwiftUI

struct AuthView: View {
  // MARK: - Properties

  @StateObject private var authViewModel = AuthViewModel()

  @State private var emailAddress: String = ""
  @State private var password: String = ""

  @State private var showAlert: Bool = false
  @State private var alertTitle: String = ""
  @State private var alertMessage: String = ""

  // MARK: - Body Properties

  var body: some View {
    if let currentUser = Auth.auth().currentUser {
      VStack {
        Text("Welcome \(self.authViewModel.getCurrentUserEmail())")
        Button(
          action: {
            self.signOut()
          },
          label: {
            Text("Sign-Out")
          }
        )
      }
      .alert(self.alertTitle, isPresented: self.$showAlert) {
        //
      } message: {
        Text(self.alertMessage)
      }
    } else {
      VStack {
        TextField("Email Address", text: self.$emailAddress)
          .baseTextFieldStyle()
          .keyboardType(.emailAddress)

        SecureField("Password", text: self.$password)
          .baseTextFieldStyle()
          .keyboardType(.alphabet)

        HStack {
          Button(
            action: {
              self.signIn()
            },
            label: {
              Text("Sign-In")
            }
          )

          Button(
            action: {
              self.signUp()
            },
            label: {
              Text("Sign-Up")
            }
          )
        }
      }
      .alert(self.alertTitle, isPresented: self.$showAlert) {
        //
      } message: {
        Text(self.alertMessage)
      }
    }
  }

  // MARK: - Auth Methods

  private func signIn() {
    Auth.auth().signIn(
      withEmail: self.emailAddress, password: self.password
    ) { _, error in
      if let error = error {
        debugPrint("Somethings got wrong \(error.localizedDescription)")
      } else {
        self.showAlert = true
        self.alertTitle = "Sign-In Successfully"
        self.alertMessage = "Welcome \(self.authViewModel.getCurrentUserEmail())"
      }
    }
  }

  private func signUp() {
    Auth.auth().createUser(
      withEmail: self.emailAddress, password: self.password
    ) { _, error in
      if let error = error {
        debugPrint("Somethings got wrong \(error.localizedDescription)")
      } else {
        self.showAlert = true
        self.alertTitle = "Sign-Up Successfully"
        self.alertMessage = "Account created sucessfully!"
      }
    }
  }

  private func signOut() {
    self.showAlert = true
    self.alertTitle = "Sign-Out Successfully"
    self.alertMessage = "See you again! \(self.authViewModel.getCurrentUserEmail())"
    do {
      try Auth.auth().signOut()
    } catch let signOutError {
      debugPrint("Somethings got wrong : \(signOutError.localizedDescription)")
    }
  }
}

extension View {
  func baseTextFieldStyle() -> some View {
    self.modifier(BaseTextFieldStyle())
  }
}

#Preview {
  AuthView()
}
