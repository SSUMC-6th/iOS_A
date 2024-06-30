import SwiftUI
import Moya

struct LogInView: View {
    
    @State var id: String = ""
    @State var password: String = ""
    @State var showAlert: Bool = false
    @State var showAutoLoginAlert: Bool = false
    @State var alertMessage: String = ""

    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack (spacing: 0) {
            Text("로그인")
                .padding(.top, 230)
                .padding(.bottom, 20)
            
            TextField("아이디를 입력하세요.", text: $id)
                .frame(maxWidth: .infinity)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
            
            
            SecureField("비밀번호를 입력하세요.", text: $password)
                .frame(maxWidth: .infinity)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
            
            Button(action: {
                loginAPI(id: id, password: password, completion: { loginSuccess in
                    if loginSuccess {
                        authViewModel.loginSuccess = true
                        showAlert = true
                        showAutoLoginAlert = true
                    } else {
                        showAlert = true
                        alertMessage = "로그인 실패"
                    }
                })
            }, label: {
                Text("Log In")
                    .foregroundColor(.white)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(Color.mint)
                    .cornerRadius(20)
            })
            .padding(.horizontal, 20)
            .padding(.top, 10)
            
            
            Button(action: {
                signupAPI(id: id, password: password, completion: { statusCode in
                    if statusCode == 200 {
                        alertMessage = "회원가입 성공"
                    } else if statusCode == 400 {
                        alertMessage = "이미 존재하는 id입니다."
                    } else if statusCode == 404 {
                        alertMessage = "네트워크 통신에 실패하였습니다."
                    }
                    showAlert = true
                })
            }, label: {
                Text("Sign Up")
                    .foregroundColor(.white)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(Color.mint)
                    .cornerRadius(20)
            })
            .padding(.horizontal, 20)
            .padding(.top, 10)
            
        }
        .padding()
        Spacer()
        .alert(isPresented: $showAlert) {
            if showAutoLoginAlert {
                return Alert(
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
                return Alert(
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
                } else {
                    completion(400)
                }
            case .failure:
                completion(404)
            }
        }
    }
}

struct TokenResponse: Decodable {
    var access_token: String
    var refresh_token: String
}

#Preview {
    LogInView()
}
