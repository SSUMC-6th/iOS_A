//
//  LoginView.swift
//  baki_week10
//
//  Created by 박희민 on 6/29/24.
//
import SwiftUI
import Moya

struct LoginView: View {
    @State private var id = ""
    @State private var password = ""
    @State var showAlert: Bool = false
    @State var showAutoLoginAlert: Bool = false
    @State var alertMessage: String = ""
    
    @EnvironmentObject var authViewModel: authViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("로그인 - 바키").padding(.bottom)
                TextField("아이디를 입력하세요", text: $id)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                SecureField("비밀번호를 입력하세요", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                
                Button(action: {
                    loginAPI(id: id, password: password) { loginSuccess in
                        if loginSuccess {
                            authViewModel.loginSuccess = true
                            showAlert = true
                            showAutoLoginAlert = true
                        } else {
                            showAlert = true
                            alertMessage = "로그인에 실패하였습니다."
                        }
                    }
                }, label: {
                    Text("로그인")
                        .fontWeight(.bold)
                        .frame(width: 360, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                })
                
                Button(action: {
                    signupAPI(id: id, password: password) { statusCode in
                        if statusCode == 200 {
                            alertMessage = "회원가입에 성공했습니다."
                        } else if statusCode == 400 {
                            alertMessage = "이미 존재하는 id입니다."
                        } else if statusCode == 404 {
                            alertMessage = "네트워크 통신에 실패하였습니다."
                        }
                        showAlert = true
                    }
                }, label: {
                    Text("회원가입")
                        .fontWeight(.bold)
                        .frame(width: 360, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                })
                
                Spacer()
            }
            .padding()
            .alert(isPresented: $showAlert){
                if showAutoLoginAlert {
                    Alert(
                        title: Text("자동 로그인 활성화"),
                        message: Text("자동 로그인을 활성화 하시겠습니까?"),
                        primaryButton: .default(Text("취소").foregroundColor(.blue), action: {
                            TokenManager.shared.isAutoLogin = false
                        }),
                        secondaryButton: .default(Text("확인").foregroundColor(.red), action: {
                            TokenManager.shared.isAutoLogin = true
                        })
                    )
                } else {
                    Alert(
                        title: Text(""),
                        message: Text(alertMessage),
                        dismissButton: .default(Text("확인"))
                    )
                }
            }
            
        }
    }
    
    // MARK: Function
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
