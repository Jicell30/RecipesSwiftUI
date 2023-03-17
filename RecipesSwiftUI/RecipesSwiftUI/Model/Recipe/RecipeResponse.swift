//
//  RecipeResponse.swift
//  RecipesSwiftUI
//
//  Created by Jicell on 3/17/23.
//

import Foundation

struct RecipeResponse: Decodable, Hashable, Encodable {
    let meals: [Recipe]?
    enum CodingKeys: String, CodingKey {
        case meals = "meals"
    }
}
