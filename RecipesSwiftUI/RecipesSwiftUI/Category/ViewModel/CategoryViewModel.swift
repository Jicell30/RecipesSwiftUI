//
//  CategoryViewModel.swift
//  RecipesSwiftUI
//
//  Created by Jicell on 3/17/23.
//

import Foundation
import Combine

final class CategoryViewModel:ObservableObject {
    var persistence: DataProvider
    
    // MARK: Properties
    
    @Published var categories: [Category] = []
    
    
    // MARK: Initializers
    @Published var showAlert = false
    @Published var errorMsg = ""
    
    var subscribers = Set<AnyCancellable>()
    
    init(persistence: DataProvider = NetworkPersistence()) {
        self.persistence = persistence
       
       fetchCategory()
    }
    
    func fetchCategory() {
        persistence.getMealsCategory()
            .sink { completion in
                
            } receiveValue: { [weak self] meal in
                self?.categories = meal.categories
            }
            .store(in: &subscribers)

    }
}
