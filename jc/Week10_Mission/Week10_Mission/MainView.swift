//
//  MainView.swift
//  Week10_Mission
//
//  Created by Jiwoong CHOI on 6/26/24.
//

import SwiftUI

struct MainView: View {
  @EnvironmentObject var authViewModel: AuthViewModel
  @State private var showAlert = false  // Add state for alert

  var body: some View {
    VStack {
      Text("Access Token : \(self.authViewModel.getUserAccessToken())")
        .padding()
      Text("Refresh Token : \(self.authViewModel.getUserRefreshToken())")
        .padding()
      Button("Sign Out") {
        authViewModel.signout()
        showAlert = true  // Trigger alert
      }
      .padding()
      .alert("Signed Out", isPresented: $showAlert) {  // Define the alert
        Button("OK", role: .cancel) { 
          self.authViewModel.isLoggedIn = false
        }
      } message: {
        Text("User signed out successfully!")
      }
    }
  }
}

#Preview {
  MainView()
}
