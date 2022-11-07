//
//  UserModel.swift
//  Eat_it
//
//  Created by Tatiana Simmer on 04/11/2022.
//

import Foundation
//
//struct User: Codable {
//    var firstName: String
//    var lastName: String?
//    var email: String
//    var password: String
//    var image: String?
//    var userName: String
//}

struct User: Codable, Identifiable {
    let id: Int
    let firstName, lastName, email, password: String
    let image, userName, createdAt, updatedAt: String
//    let recipes: [Recipe]
}
//
//// MARK: - Recipe
//struct Recipe: Codable {
//    let id: Int
//    let recipeName, recipeDescription, image, cookingTime: String
//    let season, difficulty: String
//    let budget: Int
//    let category, createdAt, updatedAt: String
//    let userID: Int
//
//    enum CodingKeys: String, CodingKey {
//        case id, recipeName
//        case recipeDescription = "description"
//        case image, cookingTime, season, difficulty, budget, category, createdAt, updatedAt
//        case userID = "userId"
//    }
//}
