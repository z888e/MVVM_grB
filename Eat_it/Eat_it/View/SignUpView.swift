//
//  SignUpView.swift
//  Eat_it
//
//  Created by Cynthia on 07/11/2022.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var userVM: UserVM
    @State var firstname = ""
    @State var lastname = ""
    @State var email = ""
    @State var image = ""
    @State var password = ""
    @State var username = ""
    var body: some View {

        VStack {
            Text("Sign Up")
            ScrollView {
                TextField("Votre Prénom", text: $firstname, prompt: Text("Firstname")).border(.black, width: 1).padding()
                TextField("Votre Nom", text: $lastname, prompt: Text("Name")).border(.black, width: 1).padding()
                TextField("Votre email", text: $email, prompt: Text("email")).border(.black, width: 1).padding()
                TextField("Votre mots de passe", text: $password, prompt: Text("Password")).border(.black, width: 1).padding()
//                TextField("Votre Image", text: $image, prompt: Text("image")).border(.black, width: 1).padding()
                TextField("Votre Pseudo", text: $username, prompt: Text("username")).border(.black, width: 1).padding()
                //        }
                Button {
                    Task {
                        userVM.users = try await userVM.postUser(firstname: firstname, lastName: lastname, email: email, password: password, image: image, username: username)
                        //UserVM.localUser = try await
                    }
                    Task {
                        firstname = ""
                        lastname = ""
                        email = ""
                        password = ""
                        image = ""
                        username = ""
                        
                    }

                } label: {
                    VStack{
                        Text("Send")
                    }
                }
            }
        }

    }
}
struct SignUpView_Previews: PreviewProvider {
        static let userVM = UserVM()
        static var previews: some View {
            SignUpView()
                .environmentObject(userVM)
        }
}
