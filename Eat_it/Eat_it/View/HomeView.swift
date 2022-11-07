//
//  HomeView.swift
//  Eat_it
//
//  Created by Cynthia on 07/11/2022.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var recipeViewModel: ViewModel
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    LogInView()
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 50).frame(width: 150, height: 70).foregroundColor(Color("vertMoyen")).padding()
                        Text("Login").foregroundColor(Color.white)
                    }.padding()
                }
                NavigationLink {
                    SignUpView()
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 50).frame(width: 150, height: 70).foregroundColor(Color("vertClair")).padding()
                        Text("Sign Up").foregroundColor(Color.white)
                    }.padding()
                }
                NavigationLink {
                    RecipeListView()
                } label: {
                        Text("se connecter sans mots de passe").foregroundColor(Color("vertFonce"))
                }
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static let recipeViewModel = ViewModel()
    static var previews: some View {
        HomeView()
            .environmentObject(recipeViewModel)
        
    }
}
