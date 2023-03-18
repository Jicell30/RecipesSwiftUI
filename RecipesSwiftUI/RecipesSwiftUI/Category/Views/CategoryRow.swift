//
//  CategoryRow.swift
//  RecipesSwiftUI
//
//  Created by Jicell on 3/17/23.
//

import SwiftUI

struct CategoryRow: View {
    @ObservedObject var mealVm = CategoryViewModel()
    
    var body: some View {
        
        
        
            ScrollView {
                LazyVStack {
                    
                
                ForEach(mealVm.categories,id:\.self){meal in
                    NavigationLink(value: meal) {
                        CategoryView(category: meal)
                    }
                }
                }
            }
            .background {
                Color("BgColor")
                    .ignoresSafeArea()
            }
            .navigationTitle("Meals")
            .toolbarBackground( Color("cardColor").opacity(0.6), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)

        
    }
}

struct MealRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow()
    }
}
