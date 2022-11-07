//
//  FavoriteRecipesView.swift
//  Eat_it
//
//  Created by Arnaud Nativel on 07/11/2022.
//

import SwiftUI

struct FavoriteRecipesView: View {
    
    @EnvironmentObject var recipeViewModel: ViewModel
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    var body: some View {
        NavigationView {
            //ScrollView {
                //LazyVGrid(columns: adaptiveColumns, spacing: 20)
                    
            }
            .navigationTitle("Vos recettes préférées")
        }
    }

struct FavoriteRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteRecipesView()
    }
}
