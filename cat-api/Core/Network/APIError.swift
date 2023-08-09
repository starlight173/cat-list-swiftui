//
//  APIError.swift
//  cat-api
//
//  Created by Quang Luu on 07/08/2023.
//

import Foundation

enum APIError: Error {
    case badURL
    case badResponse(status: Int)
    case url(URLError)
    case parsing(Error)
    case unknown
}
