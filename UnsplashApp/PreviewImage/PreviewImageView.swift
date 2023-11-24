//
//  PreviewImageView.swift
//  UnsplashApp
//
//  Created by Ihor Tovkach on 04.01.2022.
//

import SwiftUI
import Kingfisher

struct PreviewImageView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var imageUrl: URL
    @GestureState var zoom = CGFloat(1.0)
    @GestureState var pan = CGSize.zero
    
    var body: some View {
        ZStack {
            ZoomableScrollView {
                KFImage.url(imageUrl)
                    .loadDiskFileSynchronously()
                    .cacheMemoryOnly()
                    .fade(duration: 0.25)
                    .resizable()
                    .scaledToFit()
                    .clipped()
            }
            .navigationBarHidden(true)
        }
        .overlay(
            CloseButtonView(buttonClicked: {
                presentationMode.wrappedValue.dismiss()
            })
            .padding(10),
            alignment: .topTrailing
        )
    }
}

struct PreviewImageView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewImageView(imageUrl: URL(string: "")!)
    }
}
