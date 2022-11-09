//
//  AddRecipeView.swift
//  Eat_it
//
//  Created by Tatiana Simmer on 07/11/2022.
//

import SwiftUI

struct AddRecipeView: View {
    @EnvironmentObject var RecipeVM: RecipeVM
    @State var content = ""
    @State var recipeName: String = ""
    @State var recipeDescription: String = ""
    @State var cookingTime: String = ""

    // Difficulty Picker
    @State  var difficulty = ["Beginner", "Easy", "Medium", "Hard"]
    @State private var selectedLevel = "Beginner"
    // Season Picker
    @State var season = ["Winter", "Spring", "Summer", "Autumn"]
    @State private var selectedSeason = "Winter"
    
    
    var body: some View {
        NavigationView {
            
            ScrollView {
                ZStack {
                    VStack {
                        ZStack {
                            Rectangle()
                                .frame(width: 400, height: 250)
                                .foregroundColor(.gray).opacity(0.2)
                            .padding()
                            Circle()
                                .foregroundColor(.gray).opacity(0.1)
                                .frame(width: 100, height: 100)
                                .overlay(Circle().stroke(Color("vertMoyen").opacity(0.9), lineWidth: 2))
                            Image(systemName: "photo")
                                .foregroundColor(Color("vertMoyen"))
                            
                            Text("Add photo")
                                .foregroundColor(Color("vertMoyen"))
                                .offset(y: 70)
                        }
                        VStack{
                           
                            
                            HStack{
                                Spacer()
                                TextField("Enter Title", text: $recipeName)
                                Image(systemName: "highlighter")
                                    .font(.system(size: 30))
                                    .foregroundColor(.gray)
                                Spacer()
                            }
                            .frame(width: 370, height: 50)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1).foregroundColor(Color("vertMoyen")))
                            
                            HStack {
                                Spacer()
                                TextField("Enter Description", text: $recipeDescription)
                                Image(systemName: "keyboard")
                                    .font(.system(size: 30))
                                    .foregroundColor(.gray)
                                Spacer()
                            }
                            .frame(width: 370, height: 50)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1).foregroundColor(Color("vertMoyen")))
                            
                            HStack {
                                Spacer()
                                TextField("Enter time", text: $cookingTime)
                                Image(systemName: "clock")
                                    .font(.system(size: 30))
                                    .foregroundColor(.gray)
                                Spacer()
                            }
                            .frame(width: 370, height: 50)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1).foregroundColor(Color("vertMoyen")))
                            
                            
                            //Difficulty Picker
                            Text("Choose level: \(selectedLevel)")
                                .fontWeight(.light)
                            
                                .foregroundColor(Color("vertFonce"))
                                .frame(maxWidth: 350, alignment: .leading)
                            
                            Picker("", selection: $selectedLevel) {
                                ForEach(difficulty, id: \.self) {
                                    Text($0)
                                }
                            }
                            .frame(width: 350)
                            .pickerStyle(.segmented)
                           
                            //Season Picker
                            Text("Choose a season : \(selectedSeason)").fontWeight(.light).foregroundColor(Color("vertFonce")).frame(maxWidth: 350, alignment: .leading)
                            Picker("", selection: $selectedSeason) {
                                ForEach(season, id: \.self) {
                                    Text($0)
                                }
                            }
                            .frame(width: 350)
                            .pickerStyle(.segmented)
                        }
                        .padding()
                        Button {
                            Task {
                                try await RecipeVM.postRecipe(recipeName: recipeName, recipeDescription: recipeDescription, season: selectedSeason, difficulty: selectedLevel, cookingTime: cookingTime)
                            }
                            Task {
                                recipeName = ""
                                recipeDescription = ""
                                season = [""]
                                difficulty = [""]
                                cookingTime = ""
                            }
                            
                        } label: {
                            Text("Add")
                                .padding()
                                .frame(width: 130, height: 50)
                                .background(Color("vertMoyen").cornerRadius(10))
                                .foregroundColor(Color.white)
                        }
                        .offset(y: 50)
                    }
                }
            }
        }
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView().environmentObject(RecipeVM())
    }
}
