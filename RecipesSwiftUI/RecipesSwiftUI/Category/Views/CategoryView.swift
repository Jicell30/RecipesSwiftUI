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
        HStack {
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
        CategoryView(category: .categoryTest)
    }
}

