//
//  Alert.swift
//  Appetizers
//
//  Created by Kirill Bereznev on 9/6/24.
//

import SwiftUI


struct AlertItem: Identifiable{
    let id = UUID()
    let title: String
    let message: String
    let dismissButton: Alert.Button
}

struct AlertContext {
    
    static let invalidData = AlertItem(title: "Server Error", message: "The data received from the server was invalid", dismissButton: .default(Text("Ok")))
    
    static let invalidResponse = AlertItem(title: "Server Error", message: "Invalid responce from the server  Please try again later or contact support", dismissButton: .default(Text("Ok")))
    
    static let invalidURL = AlertItem(title: "Server Error", message: "There was an issue connecting to the server, if this persists, please contact support.", dismissButton: .default(Text("Ok")))
    
    static let unableToComplete = AlertItem(title: "Invalid unable complete", message: "Unable to complete request at this time, Please check your internert", dismissButton: .default(Text("Ok")))
}
