//
//  CloseButtonView.swift
//  UnsplashApp
//
//  Created by Ihor Tovkach on 04.01.2022.
//

import SwiftUI

struct CloseButtonView: View {
    
    var buttonClicked: () -> ()
    
    var body: some View {
        Button(action: {
            withAnimation(.default) {
                buttonClicked()
            }
        }, label: {
            Image(systemName: "xmark")
                .foregroundColor(.white)
                .padding()
                .background(Color.white.opacity(0.35))
                .clipShape(Circle())
        })
    }
}

struct CloseButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CloseButtonView(buttonClicked: {})
    }
}
