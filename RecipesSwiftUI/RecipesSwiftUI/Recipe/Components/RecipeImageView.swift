//
//  RecipeImageView.swift
//  RecipesSwiftUI
//
//  Created by Jicell on 3/17/23.
//

import SwiftUI

struct RecipeImageView: View {
    var recipe: Recipe
    var body: some View {
        if   recipe.strMealThumb != ""{
            AsyncImage(url: URL(string: recipe.strMealThumb ?? "")) { img in
                img
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                   
                    .background {
                        Circle()
                            .stroke(lineWidth: 8)
                            .foregroundColor(.black)
                    }
            } placeholder: {
                ProgressView()
               
            }
        }  else {
            Image(systemName: "photo.artframe")
                .imageScale(.large)
        }
    }
}

struct RecipeImageView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeImageView(recipe: .mealTest)
    }
}
