//
//  MealsView.swift
//  RecipesSwiftUI
//
//  Created by Jicell on 3/17/23.
//

import SwiftUI

struct MealsView: View {
    @StateObject var mealsViewModel: MealsViewModel
    
    init(category: Category) {
        self._mealsViewModel = StateObject(wrappedValue:  MealsViewModel(category: category))
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(mealsViewModel.meals, id:\.self){meal in
                    NavigationLink(value: meal) {
                        MealCardView(meal: meal)
                    }
                }
            }
        }
        
        .background {
            Color("BgColor")
                .ignoresSafeArea()
        }
    }
}

struct MealsView_Previews: PreviewProvider {
    static var previews: some View {
        MealsView(category: .categoryTest)
    }
}
