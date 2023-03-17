//
//  MealResponse.swift
//  RecipesSwiftUI
//
//  Created by Jicell on 3/17/23.
//

import Foundation
struct MealResponse: Codable, Hashable{
    let mealResponse: [Meal]
    
    enum CodingKeys: String, CodingKey {
        case mealResponse = "meals"
    }
    
}
