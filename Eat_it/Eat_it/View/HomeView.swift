//
//  HomeView.swift
//  Eat_it
//
//  Created by Cynthia on 07/11/2022.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var recipeVM: RecipeVM
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("vertMoyen").opacity(0.7)
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    NavigationLink {
                        LogInView()
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 50).frame(width: 150, height: 70).foregroundColor(Color("vertMoyen")).padding()
                            Text("Log In").foregroundColor(Color.white).fontWeight(.semibold)
                        }.padding()
                    }
                    NavigationLink {
                        SignUpView()
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 50).frame(width: 150, height: 70).foregroundColor(Color("vertClair")).padding()
                            Text("Sign Up").foregroundColor(Color.white).fontWeight(.semibold)
                        }.padding()
                    }
                    Spacer()
                    NavigationLink {
                        RecipeListView()
                    } label: {
                        Text("Continue without an account").foregroundColor(Color.white)
                    }
                    Spacer()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static let recipeVM = RecipeVM()
    static var previews: some View {
        HomeView()
            .environmentObject(recipeVM)
    }
}
