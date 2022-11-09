//
//  StepModel.swift
//  Eat_it
//
//  Created by Tatiana Simmer on 04/11/2022.
//

import Foundation

// MARK: - Step
struct Step: Codable {
    let id: Int
    let time, stepDescription, createdAt, updatedAt: String
    let recipeID: Int
    let recipe: Recipe

    enum CodingKeys: String, CodingKey {
        case id, time
        case stepDescription = "description"
        case createdAt, updatedAt
        case recipeID = "recipeId"
        case recipe
    }
}
