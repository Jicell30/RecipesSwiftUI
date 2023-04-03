//
//  RecipesSwiftUIApp.swift
//  RecipesSwiftUI
//
//  Created by Jicell on 3/17/23.
//

import SwiftUI

@main
struct RecipesSwiftUIApp: App {
    let moduleDependencies = ModuleDependencies()
    var contentView: ContentView {
        moduleDependencies.resolve()
    }
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                contentView

            }
            
        }
    }
}
