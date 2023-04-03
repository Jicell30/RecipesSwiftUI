//
//  APIMockServices.swift
//  RecipesSwiftUITests
//
//  Created by Jicell on 3/17/23.
//

import Foundation
import Combine
@testable import RecipesSwiftUI
struct APIMockServices: DataProvider {
    func queryJSON<T>(request: URLRequest, type: T.Type, decoder: JSONDecoder = JSONDecoder(), statusOK: Int = 200 ) -> AnyPublisher<T, APIErrors> where T : Decodable, T : Encodable {
        
        
        
        URLSession.shared
            .dataTaskPublisher(for: request)
            .mapError { APIErrors.general($0) }
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
    
    func getMealsCategory() -> AnyPublisher<CategoryResponse, APIErrors> {
        
      
        queryJSON(request: .request(url: .getMealCategories), type: CategoryResponse.self)
    }
    
    func getMealsCategorySearch(queryCategory: String) -> AnyPublisher<MealResponse, APIErrors> {
        
        queryJSON(request: .request(url: .getMealCategoryList(queryCategory: queryCategory)), type: MealResponse.self)
    }
    
    
    func getRecipeDetail(id:String) -> AnyPublisher<RecipeResponse, APIErrors>{
        queryJSON(request: .request(url: .getRecipe(id: id)), type: RecipeResponse.self)
        
        
    }
    func getRecipeByName(name:String) -> AnyPublisher<MealResponse, APIErrors> {
        queryJSON(request: .request(url: .getRecipeByName(recipeName: name)), type: MealResponse.self)
    }
    
}
