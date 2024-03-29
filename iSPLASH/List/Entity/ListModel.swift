//
//  ListModel.swift
//  iSPLASH
//
//  Created by Narayana Wijaya on 12/02/23.
//

import Foundation

struct ResponseModel: Decodable {
    let total: Int
    let total_pages: Int
    let results: [SplashImage]
}

struct SplashImage: Decodable {
    let id: String
    let urls: ImageURLS
    let width: Double
    let height: Double
    let description: String?
    let alt_description: String?
    let user: User?
}

struct ImageURLS: Decodable {
//    let regular: String
    let small: String
}

struct User: Decodable {
    let id: String
    let name: String
    let profile_image: ImageURLS?
}
