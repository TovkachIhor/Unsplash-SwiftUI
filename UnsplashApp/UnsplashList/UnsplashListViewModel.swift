//
//  UnsplashListViewModel.swift
//  UnsplashApp
//
//  Created by Ihor Tovkach on 04.01.2022.
//

import Foundation
import Combine
import SwiftUI

class UnsplashListViewModel : ObservableObject {
    
    @Published var images = Images()
    
    var dataManager: UnsplashServiceProtocol
    private var cancellableSet: Set<AnyCancellable> = []
    
    init( dataManager: UnsplashServiceProtocol = UnslashService.shared) {
        self.dataManager = dataManager
        fetchImage(query: "")
    }
    
    func fetchImage(query: String) {
        if (query.isEmpty) {
            getImage()
        } else {
            searchImage(query: query)
        }
    }
    
    private func getImage() {
        dataManager.fetchImage(page: images.nextPage)?
            .sink { [weak self] (dataResponse) in
                self?.images += dataResponse.value ?? []
            }.store(in: &cancellableSet)
    }
    
    private func searchImage(query: String) {
        dataManager.fetchSearchImage(page: images.nextPage, query: query)?
            .sink { [weak self] (dataResponse) in
                self?.images += dataResponse.value?.results ?? []
            }.store(in: &cancellableSet)
    }
    
    func cleanDataSource() {
        images = []
    }
}
