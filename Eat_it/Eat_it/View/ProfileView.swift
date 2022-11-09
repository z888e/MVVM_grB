//
//  ProfileView.swift
//  Eat_it
//
//  Created by Zoé Hartman on 09/11/2022.
//

import SwiftUI

struct ProfileView: View {
    
    var loggedUser: User
    var registeredSince: String = ""
    
    init(loggedUser: User, registeredSince: String) {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .short
        let dateFormatter = ISO8601DateFormatter()
        let dateFormattedRegSince = dateFormatter.date(from:loggedUser.createdAt)!
        let relativeDate = formatter.localizedString(for: dateFormattedRegSince, relativeTo: Date.now)
        self.loggedUser = loggedUser
        self.registeredSince = relativeDate
    }
    
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
            VStack{
                Text(loggedUser.createdAt)
                    
                  //  .formatted(date: .long, time: .omitted))
                    .font(.callout)
                    .opacity(0.4)
                    .padding(20)
                //Text("Inscrite " + user.timeSinceRegister)
            }
            
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
        ProfileView(loggedUser: tempUsers[0], registeredSince: "2022-09-22T12:21:11+0100")
    }
}
