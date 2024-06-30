import Moya
import Foundation

enum LoginAPI {
    case login(id: String, pw: String)
    case signup(id: String, pw: String)
}

extension LoginAPI: TargetType {
    var baseURL: URL {
        return URL(string: "http://oxdjww.xyz:8080")!
    }
    
    var path: String {
        switch self {
        case .login:
            return "/login"
        case .signup:
            return "/signup"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login:
            return .post
        case .signup:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case let .login(id, pw):
            let parameters: [String: Any] = [
                "username": id,
                "password": pw
            ]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        case .signup(id: let id, pw: let pw):
            let parameters: [String: Any] = [
                "username": id,
                "password": pw
            ]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}

