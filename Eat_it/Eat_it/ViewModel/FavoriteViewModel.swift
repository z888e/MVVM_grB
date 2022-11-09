//
//  FavoriteViewModel.swift
//  Eat_it
//
//  Created by Arnaud Nativel on 09/11/2022.
//

import Foundation

import SwiftUI

class FavoriteVM: ObservableObject {
 
    @Published var favorites : [Favorite] = [Favorite](favoriteTemp)
    @Published var error: Error?
    
    let baseURL = "http://localhost:3000"

    //-MARK: GET
    func fetchFavorite() async throws -> [Favorite] {
        print("1")
        //url
        guard let url = URL(string: "\(baseURL)/favorite")
        else {
            fatalError("Missing URL")
        }
        //req (GET is default)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        //launch ses
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        //get res
        guard (response as? HTTPURLResponse)?.statusCode == 200
        else {
            fatalError("Error while fetching data")
        }
        //decode json
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let favorites = try decoder.decode([Favorite].self, from: data)
        //return swift
        print("success: \(favorites)")
        return favorites
        
    }
    
    
    
//    //-MARK:  PUT
//    func updateFavorite(_ recipe: Recipe, id: Int) async throws -> Favorite {
//        //url
//        guard let url = URL(string: "\(baseURL)/recipe/\(id)")
//        else {throw ErrorMessage.badURL}
//        //create req
//        var urlRequest = URLRequest(url: url)
//        urlRequest.httpMethod = "PUT"
//        //add http body+headers
//        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
//        //add params
//        let params: [String: String] = [
//            "recipeName" : String(recipe.recipeName),
//            "description" : String(recipe.recipeDescription),
//            "image" : String(recipe.image),
//            "cookingTime" : String(recipe.cookingTime),
//            "season" : String(recipe.season),
//            "difficulty" : String(recipe.difficulty),
//            "budget" : String(recipe.budget),
//            "category" : String(recipe.category)
//        ]
//        urlRequest.httpBody = try? JSONEncoder().encode(params)
//        //open sess
//        let (data, response) = try await URLSession.shared.data(for: urlRequest)
//        //res
//        guard (response as? HTTPURLResponse)?.statusCode == 200
//        else {
//            throw ErrorMessage.badResponse
//        }
//        //decode res
//        let jsonDecoder = JSONDecoder()
//        do {
//            let decoded = try jsonDecoder.decode(Recipe.self, from: data)
//            //get res in swift
//            return decoded
//        } catch {
//            throw ErrorMessage.decodingError
//        }
//    }
    
//    //-MARK:  DELETE
//    func deleteRecipe(id: Int) async throws -> Recipe {
//        guard let url = URL(string: "\(baseURL)/recipe/\(id)")
//        else {
//            fatalError("Missing URL")
//        }
//        var urlRequest = URLRequest(url: url)
//        urlRequest.httpMethod = "DELETE"
//
//        let (data, _) = try await URLSession.shared.data(for: urlRequest)
//
//        let decoder = JSONDecoder()
//        decoder.keyDecodingStrategy = .convertFromSnakeCase
//        let recipe = try decoder.decode(Recipe.self, from: data)
//
//        print("success deleted: \(recipe)")
//        return recipe
//    }
    
    //-MARK:  reload
    func reloadRecipes() async {
        do {
            favorites = try await fetchFavorite()
            error = nil
        } catch {
            self.error = error
        }
    }
}

var favoriteTemp: [Favorite] = [
    Favorite(id: 1, userId: 1, recipeId: 1, recipe: Recipe(id: 1, recipeName: "", recipeDescription: "", image: "", cookingTime: "", season: "", difficulty: "", budget: 1, category: "", createdAt: "", updatedAt: "", userID: 1, user: User(id: 1, firstName: "", lastName: "", email: "", password: "", image: "", username: "", createdAt: "", updatedAt: "")))
]
