//
//  FavoriteModel.swift
//  Eat_it
//
//  Created by Arnaud Nativel on 09/11/2022.
//

import Foundation

struct Favorite: Codable, Identifiable {
    let id: Int
    let userId: Int
    let recipeId: Int
    let recipe: Recipe
//    let user: User
}
