//
//  ProfileView.swift
//  Eat_it
//
//  Created by Zoé Hartman on 09/11/2022.
//

import SwiftUI

struct ProfileView: View {
    
    var loggedUser: User
    
//    init(user: User) {
//        let formatter = RelativeDateTimeFormatter()
//        formatter.unitsStyle = .short
//        let relativeDate = formatter.localizedString(for: user.dateOfRegister, relativeTo: Date.now)
//        self.user = user
//        self.user.timeSinceRegister = relativeDate
//    }
    
    var body: some View {
        VStack{
            Image(loggedUser.image)
                .scaledToFill()
                .frame(width: 150, height: 150)
                .clipped()
                .clipShape(Capsule())
                .shadow(radius: 5.0)
                .padding(20)
            Text("@"+loggedUser.username)
                .font(.title)
                .fontWeight(.bold)
                .padding(10)
//            VStack{
//                Text(user.dateOfBirth.formatted(date: .long, time: .omitted))
//                    .font(.callout)
//                    .opacity(0.4)
//                    .padding(20)
//                Text("Inscrite " + user.timeSinceRegister)
//            }
            
                .padding(20)
            
//            Section ("Films préférés"){
//                VStack{
//                    ForEach(recipe) {el in
//                        if el.isFavorite == true {
//                            Text(el.title)
//                        }
//                    }
//                }
            }
        }
    }
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(loggedUser: tempUsers[0])
    }
}
