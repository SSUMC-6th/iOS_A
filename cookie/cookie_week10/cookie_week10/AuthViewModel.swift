import Foundation

class AuthViewModel: ObservableObject {
    @Published var loginSuccess: Bool = false
    
    func logout() {
        loginSuccess = false
        TokenManager.shared.clearTokens()
    }
}
