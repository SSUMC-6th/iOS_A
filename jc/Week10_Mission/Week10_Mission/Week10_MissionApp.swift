//
//  Week10_MissionApp.swift
//  Week10_Mission
//
//  Created by Jiwoong CHOI on 6/26/24.
//

import SwiftUI

@main
struct Week10_MissionApp: App {
  @StateObject var authViewModel =  AuthViewModel()
  
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environmentObject(self.authViewModel)
    }
}
