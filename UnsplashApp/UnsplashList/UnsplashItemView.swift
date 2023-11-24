//
//  UnsplashItemView.swift
//  UnsplashApp
//
//  Created by Ihor Tovkach on 04.01.2022.
//

import SwiftUI
import Kingfisher

struct UnsplashItemView: View {
    
    var imageUrl: URL
    var itemAppeared: () -> ()
    
    var body: some View {
        KFImage.url(imageUrl)
            .loadDiskFileSynchronously()
            .cacheMemoryOnly()
            .fade(duration: 0.25)
            .resizable()
            .scaledToFill()
            .frame(width: UIScreen.main.bounds.width/2 - 15, height: UIScreen.main.bounds.width/2 - 15, alignment: .center)
            .clipped()
            .cornerRadius(10)
            .onAppear {
                itemAppeared()
            }
    }
}

struct UnsplashItemView_Previews: PreviewProvider {
    static var previews: some View {
        UnsplashItemView(imageUrl: URL(string: "https://www.google.com.ua/images/branding/googlelogo/2x/googlelogo_light_color_272x92dp.png")!, itemAppeared: {})
    }
}
