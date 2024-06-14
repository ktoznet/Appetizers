//
//  LoadingView.swift
//  Appetizers
//
//  Created by Kirill Bereznev on 14/6/24.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let acitivityIndicatorView = UIActivityIndicatorView(style: .large)
        acitivityIndicatorView.color = UIColor.brandPrimaryColor
        acitivityIndicatorView.startAnimating()
        return acitivityIndicatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
}


struct LoadingView: View {
    var body: some View{
        ZStack{
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            
            ActivityIndicator()
        }
    }
}
