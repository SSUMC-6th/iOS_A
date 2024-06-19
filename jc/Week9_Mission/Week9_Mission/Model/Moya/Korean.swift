//
//  Korean.swift
//  Week9_Mission
//
//  Created by Jiwoong CHOI on 6/2/24.
//

import Foundation
import Moya

enum Korean {
  case users
  case posts
  case todos
  case comments
}

// MARK: - Target Type Protocol Implementation

extension Korean: TargetType {
  var baseURL: URL { URL(string: "https://koreanjson.com/")! }

  var path: String {
    switch self {
    case .users:
      return "users"
    case .posts:
      return "posts"
    case .todos:
      return "todos"
    case .comments:
      return "comments"
    }
  }

  var method: Moya.Method {
    return .get
  }

  var task: Task {
    return .requestPlain
  }

  var headers: [String: String]? {
    return ["Content-type": "application/json"]
  }
}
