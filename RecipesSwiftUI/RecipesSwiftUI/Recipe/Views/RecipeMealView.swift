//
//  RecipeMealView.swift
//  RecipesSwiftUI
//
//  Created by Jicell on 3/17/23.
//

import SwiftUI

struct RecipeMealView: View {
    @ObservedObject var recipeVM: RecipeMealViewModel
    init(meal: Meal) {
        self.recipeVM = RecipeMealViewModel(meals: meal)
    }
   
    var body: some View {
        ScrollView{
            VStack{
                ForEach(recipeVM.recipes){ meals in
                    RecipeImageView(recipe: meals)
                        .frame(width: 180, height: 180,alignment: .center)
                        .overlay(alignment: .topTrailing) {
                            Button {
                                recipeVM.likedRecipe.toggle()
                            } label: {
                                Image(systemName: "heart")
                                    .imageScale(.large)
                                    .foregroundColor(recipeVM.likedRecipe ? .red : .white)
                            }
                            .offset(x:70,y:20)
                        }
                    Text(meals.strMeal ?? "")
                        .font(.title)
                        .foregroundColor(.red)
                        .offset(x: 30)
                        .rotationEffect(Angle(degrees: -16))
                        .padding(.bottom, 40)
                    
                    HStack{
                        Text(meals.strCategory ?? "")
                            .font(.title)
                       // Spacer()
                    }
                    .padding(.leading)
                        .padding(.bottom,30)
                    VStack(alignment: .leading){

                        Text(meals.strInstructions ?? "")
                            .font(.footnote)
                            .lineSpacing(6)
                            .lineLimit(recipeVM.isExpanded ? nil : 3)
                            .overlay(
                                GeometryReader { proxy in
                                    Button(action: {
                                        withAnimation(.spring()){
                                            recipeVM.isExpanded.toggle()
                                        }
                                    }) {
                                        Text(recipeVM.isExpanded ? "See Less" : "...See More")
                                            .font(.caption).bold()
                                            .padding(.leading, 1.0)
                                            .padding(.top, 6.0)
                                            .background{
                                                RoundedRectangle(cornerRadius: 2)
                                                    .foregroundColor(.red)
                                            }
                                    }
                                    .frame(width: proxy.size.width, height: proxy.size.height, alignment: .bottomTrailing)
                                }
                            )
                    }
                    .padding(.bottom,30)
                    .padding(.leading)
                    HStack {
                        Text("Nutrition")
                        Spacer()
                    }
                    .padding(.leading)

                    ForEach(meals.ingredients ?? [], id:\.self){ ing in
                        VStack{
                            HStack{
                                Circle()
                                    .foregroundColor(.red)
                                    .frame(width: 16, height: 16)
                                Text(ing.measure)

                                    .font(.footnote)
                                Text(ing.name)
                                    .font(.footnote)

                                AsyncImage(url: URL(string:"".replaceWithPercentEncoding(name: ing.name))) { img in
                                    img
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30, height: 30)
                                        .clipShape(Circle())
                                } placeholder: {
                                    ProgressView()
                                }
                                Spacer()

                            }
                            .font(.title3)
                            .padding(.horizontal, 12)
                        }
                    }

                }
                .foregroundColor(.white)
            }
        }
       
        .background{
            Color("cardColor")
                .ignoresSafeArea()
        }
    }
}

struct RecipeMealView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeMealView(meal: .mealTest)
    }
}

