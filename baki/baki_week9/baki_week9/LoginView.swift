//
//  LoginView.swift
//  baki_week9
//
//  Created by 박희민 on 6/19/24.
//
import SwiftUI

struct LoginView: View {
    @Binding var users: [UserInfo]
    @Binding var isLoggedIn: Bool
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""

    var body: some View {
        NavigationView {
            VStack {
                Text("로그인")
                    .font(.largeTitle)
                    .padding()

                TextField("사용자명", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                SecureField("비밀번호", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button(action: {
                    login()
                }) {
                    Text("로그인")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()

                NavigationLink(destination: SuccessView(username: username), isActive: $isLoggedIn) {
                    EmptyView()
                }
                .isDetailLink(false)

                Spacer()
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text("알림"), message: Text(alertMessage), dismissButton: .default(Text("확인")))
            }
        }
    }

    func login() {
        guard !username.isEmpty && !password.isEmpty else {
            alertMessage = "사용자명과 비밀번호를 입력해주세요."
            showAlert = true
            return
        }

        // 사용자 검증
        if let user = users.first(where: { $0.username == username && $0.password == password }) {
            isLoggedIn = true // 로그인 성공 시 SuccessView를 표시하기 위해 isLoggedIn을 true로 설정
        } else {
            alertMessage = "로그인 실패: 유효하지 않은 사용자 정보입니다."
            showAlert = true
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(users: .constant([]), isLoggedIn: .constant(false))
    }
}
