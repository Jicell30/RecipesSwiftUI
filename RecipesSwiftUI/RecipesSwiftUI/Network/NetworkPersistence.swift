//
//  NetworkPersistence.swift
//  RecipesSwiftUI
//
//  Created by Jicell on 3/17/23.
//

import Foundation
import Combine

// MARK: - NetworkPersistence will allow me to recover all the values from the Network
final class NetworkPersistence:DataProvider {
    
    /// meals
    /// ```
    ///        getMealsCategory() -> AnyPublisher<CategoryResponse, APIErrors>
    ///```
    func getMealsCategory() -> AnyPublisher<CategoryResponse, APIErrors> {
        queryJSON(request: .request(url: .getMealCategories), type: CategoryResponse.self)
    }
    func getMealsCategorySearch(queryCategory: String) -> AnyPublisher<MealResponse, APIErrors> {
           queryJSON(request: .request(url: .getMealCategoryList(queryCategory: queryCategory)), type: MealResponse.self)
     }
    func getRecipeDetail(id:String) -> AnyPublisher<RecipeResponse, APIErrors> {
      queryJSON(request: .request(url: .getRecipe(id: id)), type: RecipeResponse.self)
    }
    func getRecipeByName(name:String) -> AnyPublisher<MealResponse, APIErrors> {
      queryJSON(request: .request(url: .getRecipeByName(recipeName: name)), type: MealResponse.self)
    }
    
    //This is a generic reusable function that conforms to Codable. request is the URLRequest extension, decodes the data if statusOK returns data.
    func queryJSON<T:Codable>(request:URLRequest,
                              type:T.Type,
                              decoder:JSONDecoder = JSONDecoder(),
                              statusOK:Int = 200) -> AnyPublisher<T, APIErrors> {
        
        URLSession.shared
            .dataTaskPublisher(for: request)// url request
            .mapError { APIErrors.general($0) }// mapping the errors from my API errors
            .tryMap { data, response in
                guard let response = response as? HTTPURLResponse else { throw APIErrors.nonHTTP }
                if response.statusCode == statusOK {
                    return data
                } else {
                    throw APIErrors.status(response.statusCode)
                }
            }
            .decode(type: T.self, decoder: decoder)
            .mapError {
                if let apiError = $0 as? APIErrors {
                    return apiError
                } else {
                 
                    return APIErrors.json($0)
                }
            }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
