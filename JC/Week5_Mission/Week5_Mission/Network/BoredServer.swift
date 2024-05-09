//
//  BoredServer.swift
//  Week5_Mission
//
//  Created by Jiwoong CHOI on 5/9/24.
//

import Foundation

class BoredServer {
  static let shared = BoredServer()
  private let endPointURLString = "https://www.boredapi.com/api/activity"

  func fetchData(numberOfData: Int, completion: @escaping ([BoredDataModel]) -> Void) {
    guard let endPointURL = URL(string: endPointURLString) else { return }
    let urlRequest = URLRequest(url: endPointURL)
    var results: [BoredDataModel] = []
    let group = DispatchGroup()

    for _ in 0..<numberOfData {
      group.enter()
      let task = URLSession.shared.dataTask(with: urlRequest) { data, _, _ in
        guard let data = data else {
          group.leave()
          return
        }

        do {
          let boredData = try JSONDecoder().decode(BoredDataModel.self, from: data)
          debugPrint(boredData)
          results.append(boredData)
        } catch {
          debugPrint("Some error occured...!!")
        }
        group.leave()
      }

      task.resume()
    }

    group.notify(queue: .main) {
      completion(results)
    }

  }

}
