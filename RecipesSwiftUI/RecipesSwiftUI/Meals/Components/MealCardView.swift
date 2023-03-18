//
//  MealCardView.swift
//  RecipesSwiftUI
//
//  Created by Jicell on 3/17/23.
//

import SwiftUI

struct MealCardView: View {
    var meal: Meal
    var body: some View {
        VStack {
            AsyncImage(url: meal.strMealThumb) { image in
                
                HStack(alignment: .center){
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 140, height: 140, alignment: .center)
                        .clipShape(Circle())
                    
                   
                }
            } placeholder: {
                Image(systemName: "text.below.photo")
                    .frame(width: 140, height: 140, alignment: .center)
            }
            .overlay(alignment: .topTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "heart")
                        .foregroundColor(.red)
                        .offset(x: 90)
                }

            }
            Text(meal.strMeal ?? "")
                .foregroundColor(.white)
           

        }
        .padding()
        .frame(width: 360)
        .background{
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(Color("cardColor"))
        }
    }

}

struct MealCardView_Previews: PreviewProvider {
    static var previews: some View {
        MealCardView(meal: .mealTest)
    }
}
