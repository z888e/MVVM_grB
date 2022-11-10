//
//  StepUstensilModel.swift
//  Eat_it
//
//  Created by Cynthia on 10/11/2022.
//

import Foundation

struct StepUstensil:  Codable, Identifiable  {
    var id: Int
    let recipeID, ustensilID: Int
    let updatedAt, createdAt: String
}
