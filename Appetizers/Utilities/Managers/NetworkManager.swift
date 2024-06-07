//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Kirill Bereznev on 7/6/24.
//

import Foundation


final class NetworkManager {
    static let shared = NetworkManager()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
       private let appetizerURL = baseURL + "appetizers"
    private init() {}
    
    func getAppertizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
        guard let url = URL(string: appetizerURL) else {
            completed(.failure(.invalidResponse))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let _ = error else {
                completed(.failure(.unableToComplete))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                completed(.success(decodedResponse.request))
            }catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
}
