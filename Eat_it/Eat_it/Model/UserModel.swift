//
//  UserModel.swift
//  Eat_it
//
//  Created by Tatiana Simmer on 04/11/2022.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    let firstName, lastName, email, password: String
    let image, userName, createdAt, updatedAt: String
}
