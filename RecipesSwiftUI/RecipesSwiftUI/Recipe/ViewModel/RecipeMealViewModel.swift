//
//  RecipeMealViewModel.swift
//  RecipesSwiftUI
//
//  Created by Jicell on 3/17/23.
//

import Foundation
import Combine

class RecipeMealViewModel: ObservableObject {
    
    var persistence: DataProvider
    var meals: Meal
    @Published var recipes: [Recipe] = []
    @Published  var isExpanded: Bool = false
    @Published  var likedRecipe: Bool = false
    var subscribers = Set<AnyCancellable>()
    init(meals: Meal, persistence: DataProvider = NetworkPersistence()) {
      
        self.meals = meals
        self.persistence = persistence
       fetchRecipe(id: meals.idMeal)
    }
    func fetchRecipe(id: String) {
        persistence.getRecipeDetail(id: id)
            .sink(receiveCompletion: { (completion) in
            }, receiveValue: { [weak self] recipe in
                guard let self = self else {return}
                self.recipes = recipe.meals ?? []
            })
            .store(in: &subscribers)
    }
}
