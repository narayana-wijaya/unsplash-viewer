//
//  NetworkServiceProtocol.swift
//  iSPLASH
//
//  Created by Narayana Wijaya on 14/02/23.
//

import Foundation

protocol DataService {
  func request(url: String, completion: @escaping ((Result<ResponseModel, Error>) -> Void))
}
