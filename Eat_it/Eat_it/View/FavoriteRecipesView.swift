//
//  FavoriteRecipesView.swift
//  Eat_it
//
//  Created by Arnaud Nativel on 07/11/2022.
//

import SwiftUI

struct FavoriteRecipesView: View {
    
    @EnvironmentObject var favoriteVM: FavoriteVM
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                ForEach(favoriteVM.favorites) { favorite in
                    Text(favorite.recipe.recipeName)
                }
                HStack {
                    Text("Recent Discoveries")
                    // Slider (En horizontal)
                    
                    HStack {
                        Text("Preferred Recipes by your Community")
                        // Slider(En horizontal)
                        
                        
                    HStack {
                        Text("Your Favorite Recipes - Forever Ever")
                            // Slider(En horizontal)

                            
                            
                            
                            //.navigationTitle("Vos recettes préférées)
                            //.navigationBarTitleDisplayMode(.inline)
                        }
                    }
                }
            }
        }
    }
}

struct FavoriteRecipesView_Previews: PreviewProvider {
    static let favoritevm = FavoriteVM()
    static var previews: some View {
        FavoriteRecipesView()
            .environmentObject(favoritevm)
    }
}
