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
            //FavoriteRecipesView()
            //temp : lien vers profil
            //ProfileView(loggedUser: $userVM.loggedUser)
//                .tabItem {
//                    Image(systemName: "heart.fill")
//                    Text("Profil(temp)")
//                }
            RecipeListView()
                .tabItem {
                    Image(systemName: "person.crop.circle.fill")
                    Text("Home")
                }
        }
    }
}

//struct TabBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBarView().environmentObject(userVM)
//    }
//}
