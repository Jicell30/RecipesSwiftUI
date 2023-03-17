//
//  Recipe.swift
//  RecipesSwiftUI
//
//  Created by Jicell on 3/17/23.
//

import Foundation

struct Recipe: Decodable, Identifiable, Hashable, Encodable {
    let id = UUID()
    let strMeal: String?
    let strCategory: String?
    let strInstructions: String?
    let strMealThumb: String?
    let ingredients: [Ingredient]?
}

struct Ingredient: Decodable, Hashable, Encodable {
    let name: String
    let measure: String
}
//We need to develop a customized decoder that can effectively decode the API response into an array, while excluding any nil fields among the 20 available fields. This will enable us to conveniently iterate through the array without encountering any issues related to the nil/null fields.
extension Recipe {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let mealDict = try container.decode([String: String?].self)
        var index = 1
        var ingredients: [Ingredient] = []
        while let ingredient = mealDict["strIngredient\(index)"] as? String,
              let measure = mealDict["strMeasure\(index)"] as? String,
              !ingredient.isEmpty,
              !measure.isEmpty {
            ingredients.append(.init(name: ingredient, measure: measure))
            index += 1
        }
        
            self.ingredients = ingredients
        
            strMeal = mealDict["strMeal"] as? String ?? ""
            strCategory = mealDict["strCategory"] as? String ?? ""
            strInstructions = mealDict["strInstructions"] as? String ?? ""
            strMealThumb = mealDict["strMealThumb"] as? String ?? ""
           
        }
    }

#if DEBUG
extension Recipe {
    static let mealTest = Recipe(strMeal: "Baked salmon with fennel & tomatoes", strCategory: "Seafood", strInstructions: "Heat oven to 180C/fan 160C/gas 4. Trim the fronds from the fennel and set aside. Cut the fennel bulbs in half, then cut each half into 3 wedges. Cook in boiling salted water for 10 mins, then drain well. Chop the fennel fronds roughly, then mix with the parsley and lemon zest.\r\n\r\nSpread the drained fennel over a shallow ovenproof dish, then add the tomatoes. Drizzle with olive oil, then bake for 10 mins. Nestle the salmon among the veg, sprinkle with lemon juice, then bake 15 mins more until the fish is just cooked. Scatter over the parsley and serve.", strMealThumb:  "https://www.themealdb.com/images/media/meals/1548772327.jpg",ingredients: Recipe.ingredientTest )
    
    static let ingredientTest: [Ingredient]?  =
    [
        Ingredient(name: "Fennel", measure: "2 medium"),
        Ingredient(name: "Parsley", measure: "2 tbs chopped"),
        Ingredient(name: "Cherry Tomatoes", measure: "Juice of 1"),
        Ingredient(name: "Olive Oil", measure: "175g"),
        Ingredient(name: "Baking Powder", measure: "1 tbs"),
        Ingredient(name: "Salmon", measure: "350g"),
        Ingredient(name: "lack Olives", measure: "To serve")
    ]
}
#endif
