//
//  SearchView.swift
//  RecipesSwiftUI
//
//  Created by Jicell on 3/17/23.
//

import SwiftUI

//MARK: - SearchView
struct SearchView: View {
    @StateObject var vm = SearchViewViewModel()
  
    var body: some View {
        VStack {
            TextField("Search Recipe", text: $vm.searchRecipe)
                .padding(.horizontal,12)
                .frame(height: 60)
                .overlay(alignment: .topTrailing) {
                    Button {
                        vm.searchRecipe = ""
                    } label: {
                        Image(systemName: "xmark")
                    }
                    .offset(x:-20,y:20)

                }
                .background{
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(.white)
                }
                .padding()
            
            
            ScrollView {
               
                VStack {
                if vm.searchRecipes.isEmpty {
                    withAnimation(.easeIn(duration: 3)){
                        Text("Please search a recipe")
                            .font(.headline)
                            .foregroundColor(.red)
                    }
                    
                } else {
                    ForEach(vm.searchRecipes, id:\.self){meal in
                        NavigationLink(value: meal) {
                            withAnimation(.easeIn(duration: 3)){
                                MealCardView(meal: meal)
                                
                            }
                        }
                    }
                }
                
                
                    
                }
                
            }
               
        }
        .background{
            Color("BgColor").ignoresSafeArea()
        }
        //.onChange listens to new value on the @published variable(searchRecipe)
        .onChange(of: vm.searchRecipe) { newValue in
            vm.debouncedText = newValue
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

