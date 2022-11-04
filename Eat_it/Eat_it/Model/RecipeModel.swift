//
//  RecipeModel.swift
//  Eat_it
//
//  Created by Cynthia on 04/11/2022.
//

import Foundation

struct Recipe: Codable, Identifiable {
    var id : Int
    var recipeName: String
    var description: String
    var image: String
    var cookingTime: String
    var season: String
    var difficulty: String
    var budget: String
    var category: String
}
