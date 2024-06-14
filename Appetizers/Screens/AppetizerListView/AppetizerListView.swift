//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Kirill Bereznev on 7/6/24.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        ZStack{
            NavigationView {
                List(viewModel.appetizers) { appetizer in
                    AppertizeListCell(appetizer: appetizer)
                }
                .navigationTitle("🍟 Appetizers")
            }
            .onAppear {
                viewModel.getAppetizers()
            }
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertTime){ alertItem in
            Alert(title: Text(alertItem.title),  message: Text(alertItem.message), dismissButton: alertItem.dismissButton)
        }
    }
}


#Preview {
    AppetizerListView()
}
