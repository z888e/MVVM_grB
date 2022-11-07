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
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                    ForEach(recipeViewModel.recipes) { recipe in
                        NavigationLink {
                            RecipeDetailView(recipe: recipe)
                        } label: {
                            ZStack{
                                Image(recipe.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 170, height: 170)
                                    .cornerRadius(20)
                                    .shadow(color: .black, radius: 3, x:0, y: 0)
                                VStack{
                                    ZStack{
                                        Color.brown.opacity(0.3)
                                            .padding()
                                            .foregroundColor(.white)
                                            .font(.headline)
                                        HStack{
                                            Text(recipe.recipeName)
                                                .lineLimit(2)
                                                .font(.title2)
                                                .foregroundColor(.white)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                .onAppear() {
                    Task {
                        recipeViewModel.recipes = try await recipeViewModel.fetchRecipes()
//                        recipeViewModel.recipes = tempRecipes
                    }
                }
            }
            .navigationTitle("Eat It")
        }.navigationBarHidden(true)
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static let recipeViewModel = ViewModel()
    static var previews: some View {
        RecipeListView()
            .environmentObject(recipeViewModel)
    }
}
