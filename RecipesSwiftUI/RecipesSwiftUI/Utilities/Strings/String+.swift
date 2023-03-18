//
//  String+.swift
//  RecipesSwiftUI
//
//  Created by Jicell on 3/17/23.
//

import Foundation
extension String {
    func replaceWithPercentEncoding(name: String) -> String {
        "https://www.themealdb.com/images/ingredients/\(name).png".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? name
    }
}
