//
//  LoginView.swift
//  iOS_study_week10
//
//  Created by 김의정 on 6/28/24.
//

import SwiftUI
import Moya

struct LoginView: View {
    @State var id: String = ""
    @State var password: String = ""
    @State var showAlert: Bool = false
    @State var showAutoLoginAlert: Bool = false
    @State var alertMessage: String = ""
    
    @EnvironmentObject var authViewModel: AuthViewModel
    var body: some View {
        NavigationView {
            VStack(spacing: 0){
                Text("UMC - 6th iOS 로그인💫")
                    .padding(.top, 136)
                
                TextField("아이디", text: $id)
                    .padding(.leading, 20)
                    .padding(.vertical, 16)
                    .frame(width: 335, alignment: .leading) // leading 과 center의 차이가 없는 이유는 텍스트 필드라서?
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.gray)
                    )
                    .padding(.top, 68)
                    .padding(.horizontal, 0)
                
                TextField("비밀번호", text: $password)
                    .padding(.leading, 20)
                    .padding(.vertical, 16)
                    .frame(width: 335, alignment: .leading)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.gray)
                    )
                    .padding(.top, 8)
                    .padding(.horizontal, 20)
                
                Button(action: {
                    loginAPI(id: id, password: password, completion: {
                        loginSuccess in
                        if loginSuccess {
                            authViewModel.loginSuccess = true
                            showAlert = true
                            showAutoLoginAlert = true
                        }
                        else {
                            showAlert = true
                            alertMessage = "로그인에 실패하였습니다."
                        }
                    })
                }, label: {
                    Text("로그인")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(.mint)
                        .cornerRadius(20)
                })
                .padding(.horizontal, 20)
                .padding(.top, 68)
                
                Button(action: {
                    signupAPI(id: id, password: password, completion: {
                        statusCode in
                        if statusCode == 200 {
                            alertMessage = "회원가입에 성공했습니다."
                        }
                        else if statusCode == 400 {
                            alertMessage = "이미 존재하는 id입니다."
                        }
                        else if statusCode == 404 {
                            alertMessage = "네트워크 통신에 실패하였습니다."
                        }
                        showAlert = true
                    })
                }, label: {
                    Text("회원가입")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(.mint)
                        .cornerRadius(20)
                })
                .padding(.horizontal, 20)
                .padding(.top, 8)
                
                Spacer()
            }
            .alert(isPresented: $showAlert){
                if showAutoLoginAlert {
                    Alert(
                        title: Text("자동 로그인 활성화"),
                        message: Text("자동 로그인을 활성화 하시겠습니까?"),
                        primaryButton: .default(Text("취소").foregroundColor(.blue), action: {
                            TokenManager.shared.isAutoLogin = false
                        }),
                        secondaryButton: .default(Text("학인").foregroundColor(.red), action: {
                            TokenManager.shared.isAutoLogin = true
                        })
                    )
                }
                else {
                    Alert(
                        title: Text(""),
                        message: Text(alertMessage),
                        dismissButton: .default(Text("확인"))
                    )
                }
            }
        }
    }
    
    let provider = MoyaProvider<LoginAPI>()
    func loginAPI(id: String, password: String, completion: @escaping (Bool) -> Void) {
        provider.request(.login(id: id, password: password)) { result in
            DispatchQueue.main.async {
                switch result {
                case let .success(response):
                    if let tokenResponse = try? response.map(TokenResponse.self) {
                        TokenManager.shared.accessToken = tokenResponse.access_token
                        TokenManager.shared.refreshToken = tokenResponse.refresh_token
                        completion(true)
                    } else {
                        completion(false)
                    }
                case .failure:
                    completion(false)
                }
            }
        }
    }
    
    func signupAPI(id: String, password: String, completion: @escaping (Int) -> Void) {
        provider.request(.signup(id: id, password: password)) { result in
            DispatchQueue.main.async {
                switch result {
                case let .success(response):
                    if response.statusCode == 200 {
                        completion(200)
                    } else { // 400 일때
                        completion(400)
                    }
                case .failure:
                    completion(404)
                }
            }
        }
    }
    
}

struct TokenResponse: Decodable {
    var access_token: String
    var refresh_token: String
}


#Preview {
    LoginView()
}
