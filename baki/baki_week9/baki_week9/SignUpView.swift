//
//  SignUpView.swift
//  baki_week9
//
//  Created by 박희민 on 6/19/24.
//
import SwiftUI

struct SignUpView: View {
    @Binding var users: [UserInfo]
    @State private var newUsername: String = ""
    @State private var newPassword: String = ""
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""

    var body: some View {
        VStack {
            Text("회원가입")
                .font(.largeTitle)
                .padding()

            TextField("새로운 사용자명", text: $newUsername)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("새로운 비밀번호", text: $newPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                signUp()
            }) {
                Text("회원가입")
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
        .alert(isPresented: $showAlert) {
            Alert(title: Text("알림"), message: Text(alertMessage), dismissButton: .default(Text("확인")))
        }
    }

    func signUp() {
        guard !newUsername.isEmpty && !newPassword.isEmpty else {
            alertMessage = "사용자명과 비밀번호를 입력해주세요."
            showAlert = true
            return
        }

        if users.contains(where: { $0.username == newUsername }) {
            alertMessage = "이미 존재하는 사용자명입니다."
            showAlert = true
            return
        }

        let newUser = UserInfo(id: users.count + 1, username: newUsername, password: newPassword)
        users.append(newUser)

        alertMessage = "회원가입 완료: \(newUser.username)"
        showAlert = true

        newUsername = ""
        newPassword = ""
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(users: .constant([]))
    }
}
