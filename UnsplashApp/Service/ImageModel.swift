//
//  Image.swift
//  UnsplashApp
//
//  Created by Ihor Tovkach on 04.01.2022.
//

import Foundation

// MARK: - SearchImages
struct SearchImages: Codable {
    let total, totalPages: Int
    let results: [ImageModel]
    
    enum CodingKeys: String, CodingKey {
        case total
        case totalPages = "total_pages"
        case results
    }
}

// MARK: - Result
struct Result: Codable {
    let id: String
    let urls: Urls
}

// MARK: - Image
struct ImageModel: Codable {
    let id: String
    let width, height: Int?
    let urls: Urls
    
}

// MARK: - Urls
struct Urls: Codable {
    let raw, full, regular, small: String
    let thumb: String
}

typealias Images = [ImageModel]

extension Images {
    var nextPage: Int { get { self.count / 20 + 1 } }
}

//typealias Result = [Results]

