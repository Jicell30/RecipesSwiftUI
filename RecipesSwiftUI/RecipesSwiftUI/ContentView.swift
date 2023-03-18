//
//  ContentView.swift
//  RecipesSwiftUI
//
//  Created by Jicell on 3/17/23.
//

import SwiftUI

struct ContentView: View {
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
        .toolbar(.automatic, for: .tabBar)
        .toolbarColorScheme(ColorScheme(.dark), for: .tabBar)
        
            .navigationDestination(for: Category.self) { category in
               MealsView(category: category)
            }
            .navigationDestination(for: Meal.self) { recipe in
                RecipeMealView(meal: recipe)
            }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

