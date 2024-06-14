//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Kirill Bereznev on 14/6/24.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var image: Image? = nil
    func load(fromURLString urlString: String){
        NetworkManager.shared.downloadImage(fromUrlString: urlString) { uiImage in
            guard let uiUmage = uiImage else {return}
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiUmage)
            }
        }
    }
}

struct RemoteImage: View {
    var image: Image?
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}

struct AppetizerRemoteImage: View {
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear {imageLoader.load(fromURLString: urlString)}
    }
}
