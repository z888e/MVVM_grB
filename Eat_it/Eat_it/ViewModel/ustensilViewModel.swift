//
//  ustensil.swift
//  Eat_it
//
//  Created by Cynthia on 10/11/2022.
//

import Foundation

class UstensilVM: ObservableObject {
 
    @Published var ustensils : [Ustensil] = [Ustensil](tempUstensil)
    @Published var error: Error?
    
    let baseURL = "http://localhost:3000"

    //-MARK: GET
    func fetchUstensil() async throws -> [Ustensil] {
        //url
        guard let url = URL(string: "\(baseURL)/ustensil")
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
        let ustensil = try decoder.decode([Ustensil].self, from: data)
        //return swift
        print("success: \(ustensil)")
        return ustensil
        
    }
    
    //-MARK:  POST
    func postUstensil(name: String) async throws -> [Ustensil] {
        //url
        guard let url = URL(string: "\(baseURL)/ustensil")
        else {
            throw ErrorMessage.badURL
        }
        //create req
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        //add http body+headers
        let body: [String: String] = ["name": name]
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
            let ustensil = try decoder.decode([Ustensil].self, from: data)
            print("success created: \(ustensil)")
            //return swift
            return ustensil
        } catch {
            throw URLError(.badServerResponse)
        }
    }
    
    //-MARK:  PUT
    func updatestepUstensil(_ ustensil: Ustensil, id: Int) async throws -> Ustensil {
        //url
        guard let url = URL(string: "\(baseURL)/stepUstensil/\(id)")
        else {throw ErrorMessage.badURL}
        //create req
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "PUT"
        //add http body+headers
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        //add params
        let params: [String: String] = [
            "name": String(ustensil.name!)
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
            let decoded = try jsonDecoder.decode(Ustensil.self, from: data)
            //get res in swift
            return decoded
        } catch {
            throw ErrorMessage.decodingError
        }
    }

    //-MARK:  DELETE
    func deleteStepUstensil(id: Int) async throws -> Ustensil {
        guard let url = URL(string: "\(baseURL)/ustensil/\(id)")
        else {
            fatalError("Missing URL")
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "DELETE"

        let (data, _) = try await URLSession.shared.data(for: urlRequest)

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let ustensils = try decoder.decode(Ustensil.self, from: data)

        print("success deleted: \(ustensils)")
        return ustensils
    }
    
    //-MARK:  reload
    func reloadUsers() async {
        do {
            ustensils = try await fetchUstensil()
            error = nil
        } catch {
            self.error = error
        }
    }
}

var tempUstensil: [Ustensil] =
[
    Ustensil(id: 1, name: "fouet"),
    Ustensil(id: 1, name: "couteau")
]
