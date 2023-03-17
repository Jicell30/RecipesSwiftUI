//
//  Category.swift
//  RecipesSwiftUI
//
//  Created by Jicell on 3/17/23.
//

import Foundation
struct Category: Decodable, Identifiable, Encodable, Hashable {
    
    //MARK: - CodingKeys
    private enum CodingKeys: String, CodingKey {
        case id = "idCategory"
        case name = "strCategory"
        case mealImageURLString = "strCategoryThumb"
        case description = "strCategoryDescription"

    }
    
    let id: String
    let name: String
    let mealImageURLString: String
    let description: String
    
    var imageURL: URL? {
        return URL(string: self.mealImageURLString)
    }
}

#if DEBUG
extension Category {
    static let categoryTest = Category(id: "2", name: "Chicken", mealImageURLString: "https://www.themealdb.com/images/category/chicken.png", description: "Chicken is a type of domesticated fowl, a subspecies of the red junglefowl. It is one of the most common and widespread domestic animals, with a total population of more than 19 billion as of 2011.[1] Humans commonly keep chickens as a source of food (consuming both their meat and eggs) and, more rarely, as pets.")
}
#endif
