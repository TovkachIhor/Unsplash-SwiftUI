//
//  ContentView.swift
//  UnsplashApp
//
//  Created by Ihor Tovkach on 04.01.2022.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @State var navigated = false
    
    var body: some View {
        NavigationView {
            UnsplashListView()
        }
    }
}

struct SecondView: View {
    var body: some View {
        Text("This is the detail view")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
