//
//  RecipeDetailView.swift
//  Eat_it
//
//  Created by Tatiana Simmer on 04/11/2022.
//

import SwiftUI

struct RecipeDetailView: View {

    let recipe: Recipe
    
    // TODO
//    init(recipe: Recipe) {
//        let formatter = RelativeDateTimeFormatter()
//        formatter.unitsStyle = .short
//        let dateFormatter = ISO8601DateFormatter()
//        let formatteddate = dateFormatter.date(from:recipe.createdAt)!
//        let relativeDate = formatter.localizedString(for: formatteddate, relativeTo: Date.now)
//    }
    
    var body: some View {
        ScrollView{
            VStack{
                Text(recipe.recipeName)
                    .font(.title)
                Text(recipe.season)
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 300)
                    .clipped()
                HStack(spacing: 70){
                    Text(recipe.category)
                    Text(recipe.difficulty)
                    Text(String(recipe.budget))
                }
                
                VStack{
                    HStack{
                        Image(recipe.user.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .clipped()
                            .clipShape(Capsule())
                        Text(recipe.user.userName)
                    }
                    Text(recipe.createdAt)
                }.padding(20)
                
                Text(recipe.recipeDescription)
            }
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        RecipeDetailView(recipe: tempRecipes[1])
    }
}
