//
//  NetworkInterface.swift
//  RecipesSwiftUI
//
//  Created by Jicell on 3/17/23.
//

import Foundation
//MARK: - Errors
enum APIErrors:Error {
    case general(Error)
    case json(Error)
    case nonHTTP
    case status(Int)
    case invalidData
    
    var description:String {
        switch self {
        case .general(let error):
            return "General error: \(error)."
        case .json(let error):
            return "JSON Error: \(error)."
        case .nonHTTP:
            return "Non HTTP connection."
        case .status(let int):
            return "Status error: Code \(int)."
        case .invalidData:
            return "Invalid data."
        }
    }
}

// MARK: - Get Method
enum HTTPMethod:String {
    case get = "GET"
//    case post = "POST"
//    case put = "PUT"
//    case delete = "DELETE"
}

//NetworkInterface will allow me to make all the network calls to the server.
//Configure productionServer
let serverURL = URL.productionServer
extension URL {
    //Constructing the finalURL on each URLRequest
    // creation of all the infrastructure I will need
    static let productionServer = URL(string: "https://www.themealdb.com/api")! //Basic URL
    static let getMealCategories = serverURL.appending(component: "json/v1/1/categories.php") // MealCategories URL
    
    /// Get a list of meals when a categories is selected
    /// ```
    ///        getMealCategoryList(queryCategory:String) -> URL
    /// ```
    static func getMealCategoryList(queryCategory:String) -> URL {
        serverURL.appending(component: "json/v1/1/filter.php").appending(queryItems: [URLQueryItem(name: "c", value: queryCategory)])
    }
    /// Get the recipe of a meal ID
    /// ```
    ///        getRecipe(id: String) -> URL
    /// ```
    static func getRecipe(id: String) -> URL {
        serverURL.appending(path: "json/v1/1/lookup.php").appending(queryItems: [URLQueryItem(name: "i", value: id)])
    }
    /// search a recipe by name
    /// ```
    ///        getRecipeByName(recipeName: String?) -> URL
    /// ```
    static func getRecipeByName(recipeName: String?) -> URL {
        serverURL.appending(path: "json/v1/1/search.php").appending(queryItems: [URLQueryItem(name: "s", value: recipeName)])
    }
}
extension URLRequest {
    /// search a recipe by name
    /// ```
    ///        request(url:URL,method:HTTPMethod = .get) -> URLRequest
    /// ```
    ///
    static func request(url:URL,method:HTTPMethod = .get) -> URLRequest{
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        // if we needed any auth it will go here
        
        return request
    }
}
