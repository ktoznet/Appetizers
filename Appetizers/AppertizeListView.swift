//
//  AppertizeListView.swift
//  Appetizers
//
//  Created by Kirill Bereznev on 7/6/24.
//

import SwiftUI

struct AppertizeListView: View {
    let appetizer: Appetizer
    var body: some View {
        HStack{
            Image("asian-flank-steak")
                 .resizable()
                 .aspectRatio(contentMode: .fit)
                 .frame(width: 120,height: 90)
                 .cornerRadius(8)
             
             VStack(alignment: .leading, spacing: 5){
                 Text(appetizer.name)
                     .font(.title2)
                     .fontWeight(.medium)
                 
                 Text("$\(appetizer.price, specifier: "%.2f")")
                     .foregroundColor(.secondary)
                     .fontWeight(.semibold)
                 
             }
             .padding(.leading)
        }
    }
}

