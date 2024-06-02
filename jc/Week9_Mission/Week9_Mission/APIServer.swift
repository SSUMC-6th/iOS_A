//
//  APIServer.swift
//  Week9_Mission
//
//  Created by Jiwoong CHOI on 6/2/24.
//

import Foundation

struct APIServer {
  static let shared = APIServer()
  
  private let baseURL: String = "https://koreanjson.com/"
  
  func fetchData(completion : @escaping ([Users]) -> Void) {
    guard let url = URL(string: baseURL + "users") else {
      return
    }

    URLSession.shared.dataTask(with: url) { data, _, _ in
      guard let data = data else {
        debugPrint("No data received...!")
        return
      }
      
      do {
        let items = try JSONDecoder().decode([Users].self, from: data)
        
        DispatchQueue.main.async {
          completion(items)
        }
        
      } catch {
        debugPrint("Something errors in Encoding...!")
      }
    }.resume()
  }
}
