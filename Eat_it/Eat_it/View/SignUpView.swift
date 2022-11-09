//
//  SignUpView.swift
//  Eat_it
//
//  Created by Cynthia on 07/11/2022.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var UserVM: UserViewModel
    @State var firstname = "sjbkv"
    @State var lastname = "sjvbk"
    @State var email = "hjsv@gmail.com"
    @State var image = ""
    @State var password = "shjvbjAZEER12445@"
    @State var username = "sdhjvb"
    @State var error = ""
    @State var errorPassword = ""
    var body: some View {
        NavigationView {
            VStack {
                Text("Sign Up")
                ScrollView {
                    TextField("Votre Prénom", text: $firstname, prompt: Text("Firstname")).border(.black, width: 1).padding()
                    TextField("Votre Nom", text: $lastname, prompt: Text("Name")).border(.black, width: 1).padding()
                    TextField("Votre email", text: $email, prompt: Text("email")).border(.black, width: 1).padding()
                    Text(error)
                    TextField("Votre mots de passe", text: $password, prompt: Text("Password")).border(.black, width: 1).padding()
                    Text(errorPassword)
                    //                TextField("Votre Image", text: $image, prompt: Text("image")).border(.black, width: 1).padding()
                    TextField("Votre Pseudo", text: $username, prompt: Text("userName")).border(.black, width: 1).padding()
                    //        }
                    Button {
                        Task {
                            if (isValidEmail(email: email)||isValidPassword(password: password)) {
                                UserVM.users = try await UserVM.postUser(firstname: firstname, lastName: lastname, email: email, password: password, image: image, userName: username)
                            } else if (isValidEmail(email: email) == false && isValidPassword(password: password) == false){
                                error = "Veuillez rentrer un email correct"
                                errorPassword = "Votre email doit contenir une majuscule, une minuscule, un chiffre et au moins 6 caractères"
                            } else if(isValidPassword(password: password) == false) {
                                errorPassword = "Votre mot de passe doit contenir une majuscule, une minuscule, un chiffre et au moins 6 caractères"
                            } else {
                                error = "Veuillez rentrer un email correct"
                            }
                            
                        }
                        if (isValidEmail(email: email)||isValidPassword(password: password)) {
                            Task {
                                firstname = ""
                                lastname = ""
                                email = ""
                                password = ""
                                image = ""
                                username = ""
                            }
                        }
                        
                    } label: {
//                        if (isValidEmail(email: email) && isValidPassword(password: password)) {
//                            NavigationLink(destination: RecipeListView()) {
                                VStack{
                                    Text("Send")
                                }
//                            }
//                        }
                    }
                }
            }
        }

    }
}
struct SignUpView_Previews: PreviewProvider {
        static let recipeViewModel = ViewModel()
        static var previews: some View {
            SignUpView()
                .environmentObject(recipeViewModel)
        }
}
