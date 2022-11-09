//
//  FilterView.swift
//  Eat_it
//
//  Created by Tatiana Simmer on 04/11/2022.
//

import SwiftUI

struct FilterView: View {
    // Season Picker
    var seasons = ["Winter", "Spring", "Summer", "Autumn"]
    @State private var selectedSeason = "Winter"
    
    // Difficulty Picker
    var difficulty = ["Beginner", "Easy", "Medium", "Hard"]
    @State private var selectedLevel = "Beginner"
    
    // Budget Picker
    var budget = ["$", "$$", "$$$"]
    @State private var selectedBudget = "$$"
    
    // Category Picker
    var category = ["Main course", "Dessert", "Appetizer"]
    @State private var selectedCategory = "Salad"
    
    var body: some View {
        NavigationView{
            
            ZStack {
                Circle()
                    .scale(1.7)
                    .foregroundColor(Color("vertMoyen").opacity(0.5))
                    .offset(y: 470)
                Circle()
                    .scale(1.7)
                    .foregroundColor(Color("vertMoyen").opacity(0.5))
                    .offset(x: 200, y: -650)
                 
                Color("vertMoyen").opacity(0.0)
                .ignoresSafeArea()
                
                VStack{
                    
                    //Season Picker
                    Text("Choose a season : \(selectedSeason)").fontWeight(.light).foregroundColor(Color("vertFonce")).frame(maxWidth: 350, alignment: .leading)
                    Picker("", selection: $selectedSeason) {
                        ForEach(seasons, id: \.self) {
                            Text($0)
                        }
                    }
                    .frame(width: 350)
                    .pickerStyle(.segmented)
                    
                    //Difficulty Picker
                    Text("Choose your level: \(selectedLevel)")
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
                    
                    // Budget Picker
                    
                    Text("Choose your budget : \(selectedBudget)").fontWeight(.light).foregroundColor(Color("vertFonce")).frame(maxWidth: 350, alignment: .leading)
                    Picker("", selection: $selectedBudget) {
                        ForEach(budget, id: \.self) {
                            Text($0)
                        }
                    }
                    .frame(width: 350)
                    .pickerStyle(.segmented)
                    
                    // Category Picker
                    
                    Form {
                        Section {
                            Picker(selection: $selectedCategory, label: Text("Choose categories")
                                .fontWeight(.light)
                                .foregroundColor(Color("vertFonce"))) {
                                    ForEach(category, id: \.self) {
                                        Text($0)
                                    }
                                }
                          }
                    }
                    .scrollContentBackground(.hidden)
                    .foregroundColor(.black)
                    .foregroundColor(.white)
                    .frame(maxWidth: 450, maxHeight: 80)
                    
                    Spacer()
                }
                .offset(y: 80)
            }
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
