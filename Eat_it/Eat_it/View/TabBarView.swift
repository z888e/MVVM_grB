//
//  TabBarView.swift
//  Eat_it
//
//  Created by Zoé Hartman on 07/11/2022.
//

import SwiftUI

struct TabBarView: View {
    
    @EnvironmentObject var recipeVM: RecipeVM
    @EnvironmentObject var userVM: RecipeVM
    
    var body: some View {
        TabView {
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill").foregroundColor(.yellow)
                    Text("Profil")
                }
            FavoriteRecipesView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favorite")
                }
            RecipeListView()
                .tabItem {
                    Image(systemName: "applelogo")
                    Text("Recipes")
                }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static let userVM = UserVM()
    static var previews: some View {
        TabBarView().environmentObject(userVM)
    }
}
