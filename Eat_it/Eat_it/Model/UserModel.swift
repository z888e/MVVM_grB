//
//  UserModel.swift
//  Eat_it
//
//  Created by Tatiana Simmer on 04/11/2022.
//

import Foundation

struct User: Codable {
    var firstName: String?
    var lastName: String?
    var email: String?
    var password: String?
    var image: String?
    var userName: String?
}
