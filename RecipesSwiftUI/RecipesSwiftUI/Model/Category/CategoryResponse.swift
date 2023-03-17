//
//  CategoryResponse.swift
//  RecipesSwiftUI
//
//  Created by Jicell on 3/17/23.
//

import Foundation

struct CategoryResponse: Decodable,Encodable,Hashable {
    
    let categories: [Category]
}
