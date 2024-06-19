//
//  ContentView.swift
//  iOS_study_week9
//
//  Created by 김의정 on 6/19/24.
//

import SwiftUI

struct ContentView: View {
//    @State private var items: [Item] = []
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var message: String?

    
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome!")
                    .font(.system(size: 50))
                    .fontWeight(.semibold)
                
                TextField("Email", text: $email)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(5.0)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(5.0)
                
                Button(action: login) {
                    Text("로그인")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(5.0)
                }
                .padding(.top)
                
                Button(action: register) {
                    Text("회원가입")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(5.0)
                }
                
                if let message = message {
                    Text(message)
                        .foregroundColor(.red)
                        .padding()
                }
                
            }
            .padding()
        }
    }
    
//    func fetchItems() {
//            guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
//                return
//            }
//            
//            URLSession.shared.dataTask(with: url) { data, response, error in
//                if let data = data {
//                    do {
//                        let items = try JSONDecoder().decode([Item].self, from: data)
//                        DispatchQueue.main.async {
//                            self.items = items
//                        }
//                    } catch {
//                        print("Error decoding JSON: \(error)")
//                    }
//                } else if let error = error {
//                    print("Error fetching data: \(error)")
//                }
//            }.resume()
//        }
    
    
    func register() {
        if email.isEmpty || password.isEmpty {
            message = "이메일과 비밀번호를 입력하세요."
            return
        }
        
        UserDefaults.standard.set(email, forKey: "userEmail")
        UserDefaults.standard.set(password, forKey: "userPassword")
        message = "회원가입 완료. 로그인 해주세요."
    }
    
    func login() {
        if email.isEmpty || password.isEmpty {
            message = "이메일과 비밀번호를 입력하세요."
            return
        }
        
        let storedEmail = UserDefaults.standard.string(forKey: "userEmail")
        let storedPassword = UserDefaults.standard.string(forKey: "userPassword")
        
        if email == storedEmail && password == storedPassword {
            message = "로그인 성공!"
            // 다른 뷰로 리디렉션
        } else {
            message = "이메일 또는 비밀번호가 잘못되었습니다."
        }
    }
}

//struct Item: Identifiable, Codable {
//    let id: Int
//    let title: String
//}

#Preview {
    ContentView()
}
