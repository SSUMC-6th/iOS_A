//
//  Week9_MissionApp.swift
//  Week9_Mission
//
//  Created by Jiwoong CHOI on 6/2/24.
//

import FirebaseCore
import SwiftUI

@main
struct Week9_MissionApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
  ) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
