//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Kirill Bereznev on 9/6/24.
//

import SwiftUI


final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var alertTime: AlertItem?
    @Published var isLoading = false 
    
    func getAppetizers(){
        isLoading = true
        NetworkManager.shared.getAppertizers { [self] result in
            DispatchQueue.main.async {
                isLoading = false
                switch result {
                    case .success(let appetizers):
                        self.appetizers = appetizers
                    case .failure(let error):
                        switch error {
                            case .invalidResponse:
                                self.alertTime = AlertContext.invalidResponse
                                
                            case .invalidData:
                                self.alertTime = AlertContext.invalidData
                                
                            case .invalidURL:
                                self.alertTime = AlertContext.invalidURL
                                
                            case .unableToComplete:
                                self.alertTime = AlertContext.unableToComplete
                        }
                }
            }
        }
        
    }
}
