//
//  Meal.swift
//  RecipesSwiftUI
//
//  Created by Jicell on 3/17/23.
//

import Foundation

struct Meal: Codable, Hashable {
    var strMeal: String?
    var strMealThumb: URL?
    var idMeal: String
    
}
#if DEBUG
extension Meal {
    static let mealTest = Meal(strMeal: "Baked salmon with fennel & tomatoes", strMealThumb: URL(string: "https://www.themealdb.com/images/media/meals/1548772327.jpg")!, idMeal: "52959")
}
#endif
