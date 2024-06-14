//
//  AppetizerTabView.swift
//  Appetizers
//
//  Created by Kirill Bereznev on 7/6/24.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView{
            AppetizerListView()
                .tabItem {
                    Image(systemName:"house")
                    Text("Home")
                }
            
            AccountView()
                .tabItem {
                    Image(systemName:"person")
                    Text("Account")
                }
            
            OrderView()
                .tabItem {
                    Image(systemName:"bag")
                    Text("Order")
                }
        }
        .accentColor(.brandPrimaryColor)
    }
}

#Preview {
    AppetizerTabView()
}
