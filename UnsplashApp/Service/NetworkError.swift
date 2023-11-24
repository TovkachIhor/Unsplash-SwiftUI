//
//  NetworkError.swift
//  UnsplashApp
//
//  Created by Ihor Tovkach on 04.01.2022.
//

import Foundation
import Alamofire

struct NetworkError: Error {
  let initialError: AFError
  let backendError: BackendError?
}

struct BackendError: Codable, Error {
    var status: String
    var message: String
}
