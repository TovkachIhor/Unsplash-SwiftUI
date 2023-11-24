//
//  UnsplashService.swift
//  UnsplashApp
//
//  Created by Ihor Tovkach on 04.01.2022.
//

import Foundation
import Combine
import Alamofire

protocol UnsplashServiceProtocol {
    func fetchImage(page: Int) -> AnyPublisher<DataResponse<Images, NetworkError>, Never>?
    func fetchSearchImage(page: Int, query: String) -> AnyPublisher<DataResponse<SearchImages, NetworkError>, Never>?
}

class UnslashService {
    static let shared: UnslashService = UnslashService()
}

extension UnslashService: UnsplashServiceProtocol {
    func fetchImage(page: Int) -> AnyPublisher<DataResponse<Images, NetworkError>, Never>? {
        let endpoint = UnsplashEndpoint.photo(page: page)
        guard let url = endpoint.url else {
            return nil
        }
        return AF.request(url , method: .get, headers: endpoint.headers)
           .validate()
           .publishDecodable(type: Images.self)
           .map { response in
               response.mapError { error in
                   let backendError = response.data.flatMap { try? JSONDecoder().decode(BackendError.self, from: $0)}
                   return NetworkError(initialError: error, backendError: backendError)
               }
           }
           .receive(on: DispatchQueue.main)
           .eraseToAnyPublisher()
    }
    
    func fetchSearchImage(page: Int, query: String) -> AnyPublisher<DataResponse<SearchImages, NetworkError>, Never>? {
        let endpoint = UnsplashEndpoint.search(page: page, query: query)
        guard let url = endpoint.url else {
            return nil
        }
        return AF.request(url, method: .get, headers: endpoint.headers)
           .validate()
           .publishDecodable(type: SearchImages.self)
           .map { response in
               response.mapError { error in
                   let backendError = response.data.flatMap { try? JSONDecoder().decode(BackendError.self, from: $0)}
                   return NetworkError(initialError: error, backendError: backendError)
               }
           }
           .receive(on: DispatchQueue.main)
           .eraseToAnyPublisher()
    }
}
