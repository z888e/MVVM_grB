//
//  StepViewModel.swift
//  Eat_it
//
//  Created by Tatiana Simmer on 07/11/2022.
//

import Foundation

class StepVM: ObservableObject {
    
    @Published var steps : [Step] = [Step](stepTemp)
    @Published var error: Error?
    
    let baseURL = "http://localhost:3000"
    
    //-MARK: GET
    func fetchSteps() async throws -> [Step] {
        print("1")
        //url
        guard let url = URL(string: "\(baseURL)/step")
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
        let steps = try decoder.decode([Step].self, from: data)
        //return swift
        print("success: \(steps)")
        return steps
        
    }
    
    
    //-MARK:  POST
    func postStep(time: String, stepDescription: String) async throws -> [Step] {
        //url
        guard let url = URL(string: "\(baseURL)/step")
        else {
            throw ErrorMessage.badURL
        }
        //create req
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        //add http body+headers
        let body: [String: String] = ["time":time, "stepDescription": stepDescription]
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
            let step = try decoder.decode([Step].self, from: data)
            print("success created: \(step)")
            //return swift
            return step
        } catch {
            throw URLError(.badServerResponse)
        }
    }
    
    
    
    //-MARK:  reload
    func reloadRecipes() async {
        do {
            steps = try await fetchSteps()
            error = nil
        } catch {
            self.error = error
        }
    }
}

var stepTemp: [Step] = [
    Step(id: 1, time: "", stepDescription: "", createdAt: "", updatedAt: "", recipeID: 1, recipe: Recipe(id: 1, recipeName: "", recipeDescription: "", image: "", cookingTime: "", season: "", difficulty: "", budget: 10, category: "", createdAt: "", updatedAt: "", userID: 1, user: User(id: 1, firstName: "", lastName: "", email: "", password: "", image: "", username: "", createdAt: "", updatedAt: "")))
]

