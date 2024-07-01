//
//  Authentication.swift
//  Week10_Mission
//
//  Created by Jiwoong CHOI on 6/26/24.
//

import Foundation
import Moya

enum AuthMoyaTargetType {
  case login(id: String, password: String)
  case signup(id: String, password: String)
}

extension AuthMoyaTargetType: TargetType {
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
    case let .signup(id, password):
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
