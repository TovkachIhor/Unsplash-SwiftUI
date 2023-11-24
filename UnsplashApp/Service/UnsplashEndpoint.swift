//
//  UnsplashEndpoint.swift
//  UnsplashApp
//
//  Created by Ihor Tovkach on 04.01.2022.
//

import Foundation
import Alamofire

enum UnsplashEndpoint {
    case photo(page: Int)
    case search(page: Int, query: String)
}

protocol UnsplashEndpointType {
    var baseURL: String { get }
    var path: String { get }
    var headers: HTTPHeaders? { get }
    var url: URL? { get }
    var encoding: ParameterEncoding { get }
}


extension UnsplashEndpoint: UnsplashEndpointType {
    var baseURL: String  {
        return "https://api.unsplash.com/"
    }
    
    var path: String {
        switch self {
        case .photo(page: let page):
            return "photos?page=\(page)&per_page=20"
        case .search(page: let page, query: let query):
            return "search/photos?page=\(page)&query=\(query)&per_page=20"
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .photo, .search:
            return [AUTH_KEY: UNSPLASH_KEY]
        }
    }
    
    var url: URL? {
        switch self {
            default: return URL(string: "\(self.baseURL)\(self.path)")
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        default:
            return JSONEncoding.default
        }
    }
}
