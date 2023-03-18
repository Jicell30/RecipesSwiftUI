//
//  TabMeal.swift
//  RecipesSwiftUI
//
//  Created by Jicell on 3/18/23.
//

import SwiftUI

struct TabMeal: View {
    var body: some View {
        TabView {
            CategoryRow()
                .tabItem {
                    Image(systemName: "person")
                }
  
        
        SearchView()
            .tabItem {
                Image(systemName: "magnifyingglass.circle")
            }
            
        }
    }
}

struct TabMeal_Previews: PreviewProvider {
    static var previews: some View {
        TabMeal()
    }
}
