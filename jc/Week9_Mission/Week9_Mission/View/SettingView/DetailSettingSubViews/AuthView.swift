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
  @StateObject private var authViewModel = AuthViewModel()
  
  @State private var showAlert: Bool = false
  @State private var alertTitle: String = ""
  @State private var alertMessage: String = ""

  var body: some View {
    if self.authViewModel.isAuthenticated {
      Text("Welcome user \(self.authViewModel.emailAddress)")
    } else {
      VStack {
        TextField("Email Address", text: self.$authViewModel.emailAddress)
          .baseTextFieldStyle()
          .keyboardType(.emailAddress)
        
        SecureField("Password", text: self.$authViewModel.password)
          .baseTextFieldStyle()
          .keyboardType(.alphabet)
        
        HStack {
          Button(action: {
            self.signIn()
          }, label: {
            Text("Sign-In")
          })
          
          Button(action: {
            self.signUp()
          }, label: {
            Text("Sign-Up")
          })
        }
      }
      .alert(self.alertTitle, isPresented: self.$showAlert) {
        //
      } message: {
        Text(self.alertMessage)
      }

    }
  }
  
  private func signIn() {
    Auth.auth().signIn(withEmail: self.authViewModel.emailAddress, password: self.authViewModel.password) { _, error in
      if let error = error {
        debugPrint("Somethings got wrong \(error.localizedDescription)")
      } else {
        self.authViewModel.isAuthenticated = true
        self.showAlert = true
        self.alertTitle = "Sign-In Successful"
        self.alertMessage = "Welcome \(self.authViewModel.emailAddress)"
      }
    }
  }
  
  private func signUp() {
    Auth.auth().createUser(withEmail: self.authViewModel.emailAddress, password: self.authViewModel.password) { _, error in
      
      if let error = error {
        debugPrint("Somethings got wrong \(error.localizedDescription)")
      } else {
        self.showAlert = true
        self.alertTitle = "Sign-Up Successful"
        self.alertMessage = "Account created sucessfully!"
      }
    }
  }
}

struct BaseTextFieldStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .frame(width: 300, height: 30, alignment: .center)
      .multilineTextAlignment(.center)
      .clipShape(RoundedRectangle(cornerRadius: 10))
      .border(.black)
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
