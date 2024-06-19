//
//  ContentView.swift
//  baki_week9
//
//  Created by 박희민 on 6/19/24.
//

import SwiftUI

struct ContentView: View {
    @State private var users: [UserInfo] = []
    @State private var isLoggedIn: Bool = false

    var body: some View {
        NavigationView {
                VStack {
                    Spacer()
                    NavigationLink(destination: SignUpView(users: $users)) {
                        Text("회원가입")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                    .padding()

                    NavigationLink(destination: LoginView(users: $users, isLoggedIn: $isLoggedIn)) {
                        Text("로그인")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .padding()

                    Spacer()
                }
                .padding()
            
        }
    }

    func fetchUsers() {
        self.users = [
            UserInfo(id: 1, username: "user1", password: "password1"),
            UserInfo(id: 2, username: "user2", password: "password2")
        ]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
