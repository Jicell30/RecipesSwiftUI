//
//  RecipesSwiftUITests.swift
//  RecipesSwiftUITests
//
//  Created by Jicell on 3/17/23.
//

import XCTest
import Combine
@testable import RecipesSwiftUI
final class RecipesSwiftUITests: XCTestCase {
    let mockService = APIMockServices()
    var subs = Set<AnyCancellable>()
    
    
    override func tearDown()  {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        subs = []
    }

    
    func testCategories() {
        let promises = expectation(description: "Loading categories")
        mockService.getMealsCategory()
            .sink { completion in
               
            } receiveValue: { meal in
                promises.fulfill()
                XCTAssertEqual(meal.categories.count, 14)
            }
            .store(in: &subs)
        wait(for: [promises], timeout: 2)

    }
   

    func testMealsCategory() {
        let promises = expectation(description: "Loading meal category")
        mockService.getMealsCategorySearch(queryCategory: "Dessert" )
            .sink { completion in
            } receiveValue: { category in
                promises.fulfill()
            }
            .store(in: &subs)
        wait(for: [promises], timeout: 2)

        
    }
    
    
    func testRecipe() {
       
        let promises = expectation(description: "Loading Recipe")
        mockService.getRecipeDetail(id: "52772")
            .sink { completion in
               
            } receiveValue: { recipe in
                promises.fulfill()
              
            }
            .store(in: &subs)
        wait(for: [promises], timeout: 2)
    }
    
    func testRecipeSearch() {
        let promises = expectation(description: "Loading Recipe Search")
        mockService.getRecipeByName(name: "cake")
            
            .sink { completion in
              
            } receiveValue: { recipe in
                XCTAssert(recipe.mealResponse.count > 0)
                promises.fulfill()
            }
       
            .store(in: &subs)
       
        wait(for: [promises], timeout: 1)
    }

}
