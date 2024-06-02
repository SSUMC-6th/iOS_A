//
//  APIServer.swift
//  Week9_Mission
//
//  Created by Jiwoong CHOI on 6/2/24.
//

import Alamofire
import Foundation
import Moya

struct APIServer {
    static let shared = APIServer()

    private let baseURL: String = "https://koreanjson.com/"

    // MARK: - Fetch With URLSession

    func fetchUsersData(completion: @escaping ([Users]) -> Void) {
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

                completion(items)

            } catch {
                debugPrint("Something errors in Encoding...!")
            }
        }.resume()
    }

    // MARK: - Fetch With Alamofire

    func fetchPostsData(completion: @escaping ([Posts]) -> Void) {
        AF.request(baseURL + "posts").responseDecodable(of: [Posts].self) { response in
            switch response.result {
            case let .success(items):
                completion(items)

            case let .failure(error):
                debugPrint(error)
            }
        }
    }

    // MARK: - Fetch With Moya

    func fetchTodosData(completion : @escaping ([Todos]) -> Void) {
        let provider = MoyaProvider<Korean>()
        provider.request(.todos) { result in
            switch result {
            case let .success(response):
                do {
                    let items = try response.map([Todos].self, using: JSONDecoder())
                    completion(items)
                } catch {
                    
                }
            case let .failure(error):
                debugPrint(error)
            }
        }
    }
}
