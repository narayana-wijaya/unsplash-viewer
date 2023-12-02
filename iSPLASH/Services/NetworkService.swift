//
//  NetworkService.swift
//  iSPLASH
//
//  Created by Narayana Wijaya on 12/02/23.
//

import Foundation

enum ErrorRequest: Error {
  case failed
}

class NetworkService: DataService {
  static let shared = NetworkService()
  
  func request(url: String, completion: @escaping ((Result<ResponseModel, Error>) -> Void)) {
    guard let url = URL(string: url) else { return }
    
    var request = URLRequest(url: url)
    request.setValue("Client-ID 5Ug7gdbcJaRqgbVv-FvUrPl559MX2CxGlUo4e_fvNKo", forHTTPHeaderField: "Authorization")
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      guard let data = data, error == nil else {
        completion(.failure(ErrorRequest.failed))
        return
      }
      do {
        let entities = try JSONDecoder().decode(ResponseModel.self, from: data)
        completion(.success(entities))
      } catch {
        completion(.failure(error))
      }
    }
    
    task.resume()
  }
}
