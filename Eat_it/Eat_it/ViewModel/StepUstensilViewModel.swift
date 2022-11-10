//
//  StepUstensilViewModel.swift
//  Eat_it
//
//  Created by Cynthia on 10/11/2022.
//

import Foundation

class StepUstensilVM: ObservableObject {
 
    @Published var stepUstensils : [StepUstensil] = [StepUstensil]()
    @Published var error: Error?
    
    let baseURL = "http://localhost:3000"

    //-MARK: GET
    func fetchStepUstensil() async throws -> [StepUstensil] {
        //url
        guard let url = URL(string: "\(baseURL)/stepUstensil")
        else {
            throw ErrorMessage.badURL
        }
        //req (GET is default)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        //launch ses
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        //get res
        guard (response as? HTTPURLResponse)?.statusCode == 200
        else {
            throw ErrorMessage.decodingError
        }
        //decode json
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let stepUstensil = try decoder.decode([StepUstensil].self, from: data)
        //return swift
        print("success: \(stepUstensil)")
        return stepUstensil
        
    }
    
    //-MARK:  POST
    func poststepUstensil() async throws -> [StepUstensil] {
        //url
        guard let url = URL(string: "\(baseURL)/stepUstensil")
        else {
            throw ErrorMessage.badURL
        }
        //create req
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        //add http body+headers
        let body: [String: String] = [:]
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
            let stepUstensil = try decoder.decode([StepUstensil].self, from: data)
            print("success created: \(stepUstensil)")
            //return swift
            return stepUstensil
        } catch {
            throw URLError(.badServerResponse)
        }
    }
//
//    //-MARK:  PUT
//    func updatestepUstensil(_ stepUstensil: StepUstensil, id: Int) async throws -> StepUstensil {
//        //url
//        guard let url = URL(string: "\(baseURL)/stepUstensil/\(id)")
//        else {throw ErrorMessage.badURL}
//        //create req
//        var urlRequest = URLRequest(url: url)
//        urlRequest.httpMethod = "PUT"
//        //add http body+headers
//        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
//        //add params
//        let params: [String: Int] = [
//            "recipeId": Int(stepUstensil.recipeID),
//            "ustensilId": Int(stepUstensil.ustensilID)
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
//            let decoded = try jsonDecoder.decode(StepUstensil.self, from: data)
//            //get res in swift
//            return decoded
//        } catch {
//            throw ErrorMessage.decodingError
//        }
//    }
//
//    //-MARK:  DELETE
//    func deleteStepUstensil(id: Int) async throws -> StepUstensil {
//        guard let url = URL(string: "\(baseURL)/stepUstensil/\(id)")
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
//        let stepUstensils = try decoder.decode(StepUstensil.self, from: data)
//
//        print("success deleted: \(stepUstensils)")
//        return stepUstensils
//    }
    
    //-MARK:  reload
    func reloadUsers() async {
        do {
            stepUstensils = try await fetchStepUstensil()
            error = nil
        } catch {
            self.error = error
        }
    }
}

var tempstepUstensil: [StepUstensil] =
[
    StepUstensil(id: 1, recipeID: 1, ustensilID: 1, updatedAt: "", createdAt: ""),
    StepUstensil(id: 1, recipeID: 1, ustensilID: 2, updatedAt: "", createdAt: "")
]
