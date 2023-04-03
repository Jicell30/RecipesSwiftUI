//
//  CategoryViewModel.swift
//  RecipesSwiftUI
//
//  Created by Jicell on 3/17/23.
//

import Foundation
import Combine
//final class because this class won't inherit from any parent class.
//Everything that conforms to the observableObject protocol will immediately refresh the view when @Published object sends the signal.
final class CategoryViewModel:ObservableObject {
    var dependencies: MainDependenciesResolver
    var persistence: DataProvider
    
    // MARK: Properties
    //@Published allow us to create observable Objects that automatically announce when changes occur. Whenever a property is marked with @Published The view will reload and reflect those changes.
    @Published var categories: [Category] = []
    
    
    // MARK: Initializers
    @Published var showAlert = false
    @Published var errorMsg = ""
    
    var subscribers = Set<AnyCancellable>()
    
    init(dependencies: MainDependenciesResolver) {
        self.dependencies = dependencies
        self.persistence = dependencies.resolve()
       
       fetchCategory()
    }
    
    //Combine pipeline
    func fetchCategory() {
        persistence.getMealsCategory()
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    print(completion)
                case .failure(let error):
                    self?.showAlert = true
                    self?.errorMsg = error.localizedDescription
                }
            } receiveValue: { [weak self] meal in
                self?.categories = meal.categories.sorted(by: {$0.name < $1.name})
            }
            .store(in: &subscribers)
    }
}
