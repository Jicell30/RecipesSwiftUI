//
//  SearchViewModel.swift
//  RecipesSwiftUI
//
//  Created by Jicell on 3/17/23.
//

import Foundation
import Combine

class SearchViewViewModel: ObservableObject {
    var persistence: DataProvider
    @Published var searchRecipe: String = ""
    @Published var debouncedText: String = ""
    @Published var searchRecipes: [Meal] = []
    var cancelable = Set<AnyCancellable>()

    init(persistence: DataProvider = NetworkPersistence()){
        self.persistence = persistence
        $searchRecipe
            .removeDuplicates()
            .debounce(for: .seconds(0.3), scheduler: DispatchQueue.main)// debounces the string publisher, such that it delays the process of sending request to remote server.
                  .map({ (string) -> String? in
                      if string.count < 1 {
                          self.searchRecipes = []
                          return nil
                      }
                      
                      return string
                  }) // prevents sending numerous requests and sends nil if the count of the characters is less than 1.
                  .compactMap({$0})// removes the nil values so the search string does not get passed down to the publisher chain
                  .sink(receiveValue: { [weak self] searchText in
                      guard let self = self else {return}
                    //  self.debouncedText = searchText
                      self.fetchSearch(name: searchText)
                  } )
                  .store(in: &cancelable)
    }
    
    
   private func fetchSearch(name: String) {
       persistence.getRecipeByName(name: name)
            .sink(receiveCompletion: { (completion) in
                
                
            }, receiveValue: { [weak self] recipe in
            
                self?.searchRecipes = recipe.mealResponse
                
               // recipe.meals?.sorted(by: {$0.strMeal ?? "" < $1.strMeal ?? ""}) ?? []
            })
            .store(in: &cancelable)
    }
}
