//
//  MainDependenciesResolver.swift
//  RecipesSwiftUI
//
//  Created by Jicell on 4/2/23.
//

import Foundation

protocol MainDependenciesResolver {
    func resolve() -> DataProvider
    func resolve() -> CategoryViewModel
    func resolve() -> CategoryRow
    func resolve() -> ContentView
}

extension MainDependenciesResolver {
    func resolve() -> DataProvider {
        NetworkPersistence()
    }
    
    func resolve() -> CategoryRow {
        CategoryRow(mealVm: resolve())
    }
    
    func resolve() -> ContentView {
        ContentView(dependencies: self)
    }
    
}
