//
//  RecipeViewModel.swift
//  Eat_it
//
//  Created by Cynthia on 04/11/2022.
//


import Foundation
import SwiftUI

enum ErrorMessage: Error {
    case noRecipe
    case decodingError
    case badURL
    case badResponse
    
    var localizedDescription: String {
        switch self {
            case .noRecipe:
                return "No recipe"
            case .decodingError:
                return "Error while decoding error"
            case .badURL:
                return "Missing URL"
            case .badResponse:
                return "Bad response"
        }
    }
}

class ViewModel: ObservableObject {
 
    @Published var recipes : [Recipe] = [Recipe]()
    @Published var error: Error?
    
    let baseURL = "http://localhost:3000"

    //-MARK: GET
    func fetchRecipes() async throws -> [Recipe] {
        print("1")
        //url
        guard let url = URL(string: "\(baseURL)/recipe")
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
        let recipes = try decoder.decode([Recipe].self, from: data)
        //return swift
        print("success: \(recipes)")
        return recipes
        
    }
    
    //-MARK:  POST
    func postRecipe(content: String) async throws -> Recipe {
        //url
        guard let url = URL(string: "\(baseURL)/recipe")
        else {
            fatalError("Missing URL")
        }
        //create req
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        //add http body+headers
        let body: [String: String] = ["content": content]
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        //encode
        urlRequest.httpBody = try? JSONEncoder().encode(body)
        //launch ses
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        //decoder config
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do{
            //decode
            let recipe = try decoder.decode(Recipe.self, from: data)
            print("success created: \(recipe)")
            //return swift
            return recipe
        } catch {
            throw URLError(.badServerResponse)
        }
    }
    
    //-MARK:  PUT
    func updateRecipe(_ recipe: Recipe, id: Int) async throws -> Recipe {
        //url
        guard let url = URL(string: "\(baseURL)/recipe/\(id)")
        else {throw ErrorMessage.badURL}
        //create req
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "PUT"
        //add http body+headers
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        //add params
        let params: [String: String] = [
            "recipeName" : String(recipe.recipeName),
            "description" : String(recipe.recipeDescription),
            "image" : String(recipe.image),
            "cookingTime" : String(recipe.cookingTime),
            "season" : String(recipe.season),
            "difficulty" : String(recipe.difficulty),
            "budget" : String(recipe.budget),
            "category" : String(recipe.category)
        ]
        urlRequest.httpBody = try? JSONEncoder().encode(params)
        //open sess
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        //res
        guard (response as? HTTPURLResponse)?.statusCode == 200
        else {
            throw ErrorMessage.badResponse
        }
        //decode res
        let jsonDecoder = JSONDecoder()
        do {
            let decoded = try jsonDecoder.decode(Recipe.self, from: data)
            //get res in swift
            return decoded
        } catch {
            throw ErrorMessage.decodingError
        }
    }
    
    //-MARK:  DELETE
    func deleteRecipe(id: Int) async throws -> Recipe {
        guard let url = URL(string: "\(baseURL)/recipe/\(id)")
        else {
            fatalError("Missing URL")
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "DELETE"
        
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let recipe = try decoder.decode(Recipe.self, from: data)
        
        print("success deleted: \(recipe)")
        return recipe
    }
    
    //-MARK:  reload
    func reloadRecipes() async {
        do {
            recipes = try await fetchRecipes()
            error = nil
        } catch {
            self.error = error
        }
    }
}

var tempRecipes: [Recipe] =
[
    Recipe(id: 1, recipeName: "Recette 1", recipeDescription: "Description 1", image: "rPlaceholder1", cookingTime: "10", season: "Fall", difficulty: "Easy", budget: 1, category: "Dessert", createdAt: "2022-11-06T10:57:56.759Z", updatedAt: "2022-11-06T10:57:56.759Z", userID: 1, user: tempUsers[0]),
    
    Recipe(id: 2, recipeName: "Recette 2", recipeDescription: "Description 2", image: "rPlaceholder2", cookingTime: "10", season: "Fall", difficulty: "Easy", budget: 1, category: "Dessert", createdAt: "2022-11-07T00:57:56.759Z", updatedAt: "2022-11-06T10:57:56.759Z", userID: 2, user: tempUsers[1]),
    
    Recipe(id: 3, recipeName: "Recette 3", recipeDescription: "Description 3", image: "rPlaceholder3", cookingTime: "10", season: "Fall", difficulty: "Easy", budget: 1, category: "Dessert", createdAt: "2022-11-07T10:57:56.759Z", updatedAt: "2022-11-06T10:57:56.759Z", userID: 3, user: tempUsers[2])
    ]
