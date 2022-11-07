//
//  SwiftUIView.swift
//  Eat_it
//
//  Created by Zoé Hartman on 04/11/2022.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var recipeViewModel: ViewModel
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                    ForEach(recipeViewModel.recipes) { recipe in
                        NavigationLink {
                            RecipeDetailView()
                        } label: {
                            VStack{
                                Image(recipe.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 170, height: 170)
                                    .cornerRadius(20)
                                    .shadow(color: .black, radius: 3, x:0, y: 0)
                                Text(recipe.recipeName)
                                    .font(.title2)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
                .onAppear() {
                    Task {
                        recipeViewModel.recipes = try await recipeViewModel.fetchRecipes()
                    }
                }
            }
            .navigationTitle("Eat It")
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static let recipeViewModel = ViewModel()
    static var previews: some View {
        RecipeListView()
            .environmentObject(recipeViewModel)
    }
}
