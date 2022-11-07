//
//  TabBarView.swift
//  Eat_it
//
//  Created by Zoé Hartman on 07/11/2022.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
//            FavoriteRecipesView()
//                .tabItem {
//                    Image(systemName: "heart.fill")
//                    Text("Favorites")
//                }
            RecipeListView()
                .tabItem {
                    Image(systemName: "person.crop.circle.fill")
                    Text("Home")
                }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
