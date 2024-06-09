//
//  AuthenticationView.swift
//  Week9_Mission
//
//  Created by Jiwoong CHOI on 6/7/24.
//

import FirebaseAuth
import FirebaseCore
import SwiftUI
import GoogleSignIn

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
    if Auth.auth().currentUser != nil {
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
              self.signInWithEmail()
            },
            label: {
              Text("Sign In")
            }
          )
          .buttonStyle(.bordered)

          Button(
            action: {
              self.signUpWithEmail()
            },
            label: {
              Text("Sign Up")
            }
          )
          .buttonStyle(.bordered)
        }

        Button(
          action: {
            self.signInWithGoogle()
          },
          label: {
            Text("Sign in with Google")
          }
        )
        .buttonStyle(.bordered)
      }
      .alert(self.alertTitle, isPresented: self.$showAlert) {
        //

      } message: {
        Text(self.alertMessage)
      }
    }
  }

  // MARK: - Auth Methods

  private func signInWithEmail() {
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

  private func signUpWithEmail() {
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
  
  private func signInWithGoogle() {
    guard let clientID = FirebaseApp.app()?.options.clientID else { return }

    // Create Google Sign In configuration object.
    let config = GIDConfiguration(clientID: clientID)
    GIDSignIn.sharedInstance.configuration = config
    
    guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
          let window = windowScene.windows.first,
          let rootViewController = window.rootViewController else {
      print("There is no root view controller!")
      return
    }

    // Start the sign in flow!
    GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { result, error in
      guard error == nil else {
        // ...
        return
      }

      guard let user = result?.user,
        let idToken = user.idToken?.tokenString
      else {
        // ...
        return
      }

      let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                     accessToken: user.accessToken.tokenString)

      // ...
      Auth.auth().signIn(with: credential) { result, error in
        if let error = error {
          debugPrint(error.localizedDescription)
        } else {
          self.showAlert = true
          self.alertTitle = "Sign-In Successfully"
          self.alertMessage = "Welcome \(self.authViewModel.getCurrentUserEmail())"
        }
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
