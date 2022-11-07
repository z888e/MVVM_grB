//
//  RecipeModel.swift
//  Eat_it
//
//  Created by Cynthia on 04/11/2022.
//

import Foundation

struct Recipe: Codable, Identifiable{
    let id: Int
    let recipeName, recipeDescription, image, cookingTime: String
    let season, difficulty: String
    let budget: Int
    let category, createdAt, updatedAt: String
    let userID: Int
    let user: User

    enum CodingKeys: String, CodingKey {
        case id, recipeName
        case recipeDescription = "description"
        case image, cookingTime, season, difficulty, budget, category, createdAt, updatedAt
        case userID = "userId"
        case user
    }
}
