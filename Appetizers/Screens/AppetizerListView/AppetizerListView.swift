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
		NavigationView {
            List(viewModel.appetizers) { appetizer in
                AppertizeListView(appetizer: appetizer)
            }
            .navigationTitle("🍟 Appetizers")
				
		}
        .onAppear {
            viewModel.getAppetizers()
        }
        .alert(item: $viewModel.alertTime){ alertItem in
            Alert(title: Text(alertItem.title),  message: Text(alertItem.message), dismissButton: alertItem.dismissButton)
        }
        
	}
}

#Preview {
	AppetizerListView()
}
