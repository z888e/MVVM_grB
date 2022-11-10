//
//  ProfileView.swift
//  Eat_it
//
//  Created by Zoé Hartman on 09/11/2022.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var userVM: UserVM
    
    var body: some View {
        VStack{
            Image(userVM.loggedUser.image)
                .scaledToFill()
                .frame(width: 150, height: 150)
                .clipped()
                .clipShape(Capsule())
                .shadow(radius: 5.0)
                .padding(20)
            Text("@"+userVM.loggedUser.username)
                .font(.title)
                .fontWeight(.bold)
                .padding(10)
            
            VStack{
                Text("Inscrit.e " + userVM.registeredSince)
                    .font(.callout)
                    .opacity(0.4)
                    .padding(20)
                    .onAppear{
                        Task{
                            userVM.registeredSince = await userVM.relativeTime()
                        }
                    }
            }
            
            .padding(20)
        }
    }
}
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
