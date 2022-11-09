//
//  UserRecipeVM.swift
//  Eat_it
//
//  Created by Cynthia on 07/11/2022.
//

import Foundation
import SwiftUI

class UserVM: ObservableObject {
 
    @Published var users : [User] = [User]()
    @Published var error: Error?
    @Published var loggedUser: User = tempUsers[0]
    
    let baseURL = "http://localhost:3000"

    //-MARK: GET
    func fetchUsers() async throws -> [User] {
        print("1")
        //url
        guard let url = URL(string: "\(baseURL)/users")
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
        let users = try decoder.decode([User].self, from: data)
        //return swift
        print("success: \(users)")
        return users
        
    }
    
    //-MARK:  POST
    func postUser(firstname: String,lastName: String, email: String, password: String,
                  image: String, username: String) async throws -> [User] {
        //url
        guard let url = URL(string: "\(baseURL)/users")
        else {
            throw ErrorMessage.badURL
        }
        //create req
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        //add http body+headers
        let body: [String: String] = ["firstName": firstname, "lastName": lastName, "email": email, "password": password, "image": image, "username": username]
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
            let user = try decoder.decode([User].self, from: data)
            print("success created: \(user)")
            //return swift
            return user
        } catch {
            throw URLError(.badServerResponse)
        }
    }
    
    //-MARK:  PUT
    func updateUser(_ user: User, id: Int) async throws -> User {
        //url
        guard let url = URL(string: "\(baseURL)/users/\(id)")
        else {throw ErrorMessage.badURL}
        //create req
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "PUT"
        //add http body+headers
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        //add params
        let params: [String: String] = [
            "firstName": String(user.firstName),
            "lastName": String(user.lastName),
            "email": String(user.email),
            "password": String(user.password),
            "image": String(user.image),
            "username": String(user.username)
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
            let decoded = try jsonDecoder.decode(User.self, from: data)
            //get res in swift
            return decoded
        } catch {
            throw ErrorMessage.decodingError
        }
    }
    
    //-MARK:  DELETE
    func deleteUser(id: Int) async throws -> User {
        guard let url = URL(string: "\(baseURL)/users/\(id)")
        else {
            fatalError("Missing URL")
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "DELETE"
        
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let user = try decoder.decode(User.self, from: data)
        
        print("success deleted: \(user)")
        return user
    }
    
    //-MARK:  reload
    func reloadUsers() async {
        do {
            users = try await fetchUsers()
            error = nil
        } catch {
            self.error = error
        }
    }
}

var tempUsers: [User] =
[
    User(id: 1, firstName: "User1", lastName: "Lastname1", email: "1@googly.com", password: "1234", image: "uPlaceholder1", username: "aaa", createdAt: "2022-11-06T10:57:56.759Z", updatedAt: "2022-11-06T10:57:56.759Z"),
    User(id: 2, firstName: "User2", lastName: "Lastname2", email: "2@googly.com", password: "1234", image: "uPlaceholder2", username: "bbb", createdAt: "2022-11-07T00:57:56.759Z", updatedAt: "2022-11-06T10:57:56.759Z"),
    User(id: 3, firstName: "User3", lastName: "Lastname3", email: "3@googly.com", password: "1234", image: "uPlaceholder3", username: "ccc", createdAt: "2022-11-07T10:57:56.759Z", updatedAt: "2022-11-06T10:57:56.759Z"),
]
