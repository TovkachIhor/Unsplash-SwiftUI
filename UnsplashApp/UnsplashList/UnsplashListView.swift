//
//  UnsplashListView.swift
//  UnsplashApp
//
//  Created by Ihor Tovkach on 04.01.2022.
//

import SwiftUI

struct UnsplashListView: View {
    @ObservedObject var viewModel = UnsplashListViewModel()
    @State var query = ""
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 2)) {
                ForEach(viewModel.images, id: \.id) { image in
                    if let url = URL(string: image.urls.regular) {
                        NavigationLink(
                            destination: PreviewImageView(imageUrl: url)) {
                                UnsplashItemView(
                                    imageUrl: url,
                                    itemAppeared: {
                                        if (image.id == viewModel.images.last?.id) {
                                            viewModel.fetchImage(query: query)
                                        }
                                    })
                            }
                    }
                }
            }
        }
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        .navigationTitle("Unsplash")
        .searchable(text: $query, prompt: "Search")
        .onChange(of: query) { newQuery in
            viewModel.cleanDataSource()
            viewModel.fetchImage(query: newQuery)
        }
    }
}

struct UnsplashListView_Previews: PreviewProvider {
    static var previews: some View {
        UnsplashListView()
    }
}
