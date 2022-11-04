//
//  RecipeIngredientModel.swift
//  Eat_it
//
//  Created by Zoé Hartman on 04/11/2022.
//

import Foundation

//todo = quantity : Double in db
struct RecipeIngredient {
    let  recipe : Recipe
    let quantity : Int
    let unit : String
}
