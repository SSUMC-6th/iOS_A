//
//  ContentView.swift
//  Week10_Mission
//
//  Created by Jiwoong CHOI on 6/26/24.
//

import SwiftUI

struct ContentView: View {
  @StateObject var authViewModel = AuthViewModel()

  var body: some View {
    if self.authViewModel.isLoggedIn {
      MainView()
        .environmentObject(authViewModel)
    } else {
      AuthView()
        .environmentObject(authViewModel)
    }
  }
}

#Preview {
  ContentView()
}
