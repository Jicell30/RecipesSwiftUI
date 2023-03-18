//
//  MealsViewModel.swift
//  RecipesSwiftUI
//
//  Created by Jicell on 3/17/23.
//

import Foundation
import Combine

final class MealsViewModel: ObservableObject {
     var  persistence: DataProvider
    @Published var meals: [Meal] = []
    var subscribers = Set<AnyCancellable>()
    let category: Category
    
    init(category:Category, persistence: DataProvider = NetworkPersistence()){
        self.category = category
        self.persistence = persistence
        
        self.fetchMeals()
    }
    
    private func fetchMeals() {
        persistence.getMealsCategorySearch(queryCategory: category.name)
            .sink(receiveCompletion: {completion in
                print(completion)
            }, receiveValue: {  [weak self] meal in
                guard let self else {return}
                self.meals = meal.mealResponse
            })
           .store(in: &subscribers)
    }
}
