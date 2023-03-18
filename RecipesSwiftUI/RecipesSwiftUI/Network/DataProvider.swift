//
//  DataProvider.swift
//  RecipesSwiftUI
//
//  Created by Jicell on 3/17/23.
//

import Foundation
import SwiftUI
import Combine

protocol DataProvider {
    func queryJSON<T:Codable>(request:URLRequest,
                              type:T.Type,
                              decoder:JSONDecoder,
                              statusOK:Int) -> AnyPublisher<T, APIErrors>
    func getMealsCategory() -> AnyPublisher<CategoryResponse, APIErrors>
    func getMealsCategorySearch(queryCategory: String) -> AnyPublisher<MealResponse, APIErrors>
    func getRecipeDetail(id:String) -> AnyPublisher<RecipeResponse, APIErrors>
    func getRecipeByName(name:String) -> AnyPublisher<MealResponse, APIErrors>
}
