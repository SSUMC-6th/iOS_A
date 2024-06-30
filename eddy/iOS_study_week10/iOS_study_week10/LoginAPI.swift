//
//  LoginAPI.swift
//  iOS_study_week10
//
//  Created by 김의정 on 6/30/24.
//

import Moya
import Foundation

enum LoginAPI {
    case login(id: String, password: String)
    case signup(id: String, password: String)
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
        case let .login(id, password):
            let parameters: [String: Any] = [
                "username": id,
                "password": password
            ]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        case .signup(id: let id, password: let password):
            let parameters: [String: Any] = [
                "username": id,
                "password": password
            ]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}

