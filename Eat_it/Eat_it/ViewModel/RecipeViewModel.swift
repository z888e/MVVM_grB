//
//  RecipeViewModel.swift
//  Eat_it
//
//  Created by Cynthia on 04/11/2022.
//

import Foundation

import Foundation
import SwiftUI

enum ErrorMessage: Error {
    case noMessage
    case decodingError
    case badURL
    case badResponse
    
    var localizedDescription: String {
        switch self {
            case .noMessage:
                return "No message"
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
    
}
