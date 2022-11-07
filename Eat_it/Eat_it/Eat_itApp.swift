//
//  Eat_itApp.swift
//  Eat_it
//
//  Created by Zoé Hartman on 04/11/2022.
//

import SwiftUI

@main
struct Eat_itApp: App {
    @StateObject var recipeViewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(recipeViewModel)
        }
    }
}
