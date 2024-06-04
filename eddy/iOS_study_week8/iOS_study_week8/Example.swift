//
//  Example.swift
//  iOS_study_week8
//
//  Created by 김의정 on 6/4/24.
//

// 연습장
import SwiftUI

class UserData: ObservableObject {
    @Published var username = "User123"
}

struct ContentView: View {
    @ObservedObject var userData = UserData()

    var body: some View {
        VStack {
            Text("Username: \(userData.username)")

            Button("Change Username") {
                userData.username = "NewUser"
            }
        }
    }
}

#Preview {
    ContentView()
}
