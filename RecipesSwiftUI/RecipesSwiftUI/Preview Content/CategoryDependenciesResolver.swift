//
//  CategoryDependenciesResolver.swift
//  RecipesSwiftUI
//
//  Created by Jicell on 4/2/23.
//

import Foundation

protocol CategoryDependenciesResolver: MainDependenciesResolver {
    func resolve() -> CategoryViewModel
}
    
    extension CategoryDependenciesResolver {
        func resolve() -> CategoryViewModel {
            CategoryViewModel(dependencies: self)
    }
    
}
