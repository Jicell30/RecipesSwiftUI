//
//  CategoryView.swift
//  RecipesSwiftUI
//
//  Created by Jicell on 3/17/23.
//

import SwiftUI

struct CategoryView: View {
    var category: Category
    var body: some View {
        //Horizontal stack goes left to right
        HStack {
            // AsyncImage: Asyncronistly downloading an image from an URL
            //Uses the default URLSession cache
            AsyncImage(url: category.imageURL) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 70, height: 70)
                    .padding()
                    .clipShape(Circle())
                
            } placeholder: {
                Image(systemName: "text.below.photo")
                    .frame(width: 70, height: 70)
            }
            
            Text(category.name)
                .foregroundColor(.red.opacity(0.8))
            Spacer()
        }
        .padding(.horizontal,12)
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        //This is where testing for previews view is provided
        CategoryView(category: .categoryTest)
    }
}

