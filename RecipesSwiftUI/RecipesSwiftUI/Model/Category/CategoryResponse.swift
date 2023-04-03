//
//  CategoryResponse.swift
//  RecipesSwiftUI
//
//  Created by Jicell on 3/17/23.
//

import Foundation
//Category response is the top level Dictionary on the JSON
struct CategoryResponse: Decodable,Encodable,Hashable {
    
    let categories: [Category]
}
