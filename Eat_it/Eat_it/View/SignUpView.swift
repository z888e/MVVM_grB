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
    @State var error = ""
    @State var errorPassword = ""
    
    var body: some View {

        NavigationView {
            ZStack{
                Color("vertFonce").opacity(0.9)
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                VStack{
                    Text("SignUp")
                        .foregroundColor(Color("vertFonce"))
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("First name", text: $firstname)
                        .padding()
                        .frame(width: 300, height: 45)
                        .background(Color(.black).opacity(0.05))
                        .cornerRadius(15)
                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(lineWidth: 1).foregroundColor(Color.black.opacity(0.3)))
                    TextField("Last name", text: $lastname)
                        .padding()
                        .frame(width: 300, height: 45)
                        .background(Color(.black).opacity(0.05))
                        .cornerRadius(15)
                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(lineWidth: 1).foregroundColor(Color.black.opacity(0.3)))
                    TextField("Email", text: $email)
                        .padding()
                        .frame(width: 300, height: 45)
                        .background(Color(.black).opacity(0.05))
                        .cornerRadius(15)
                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(lineWidth: 1).foregroundColor(Color.black.opacity(0.3)))
                    Text(error)
                    TextField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 45)
                        .background(Color(.black).opacity(0.05))
                        .cornerRadius(15)
                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(lineWidth: 1).foregroundColor(Color.black.opacity(0.3)))
                    Text(errorPassword)
                    TextField("Nickname", text: $username)
                        .padding()
                        .frame(width: 300, height: 45)
                        .background(Color(.black).opacity(0.05))
                        .cornerRadius(15)
                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(lineWidth: 1).foregroundColor(Color.black.opacity(0.3)))
                    
                    Button {
                        Task {
                            if ((isValidEmail(email: email)) && (isValidPassword(password: password))) {
//                                userVM.users = try await userVM.postUser(firstname: firstname, lastName: lastname, email: email, password: password, image: image, username: username)
                            } else if ((isValidEmail(email: email) == false) && (isValidPassword(password: password) == false)){
                                    error = "Please enter a correct email"
                                    errorPassword = "Your email must contain a capital letter, a lower case letter, a number and at least 6 characters"
                            } else if(isValidPassword(password: password) == false) {
                                errorPassword = "Your email must contain a capital letter, a lower case letter, a number and at least 6 characters"
                            } else {
                                error = "Please enter a correct email"
                            }
                        }
                        if ((isValidEmail(email: email)) && (isValidPassword(password: password))) {
                            Task {
                                firstname = ""
                                lastname = ""
                                email = ""
                                password = ""
                                image = ""
                                username = ""
                                error = ""
                                errorPassword = ""
                            }
                        }
                    } label: {
                        
                        if (isValidEmail(email: email) && isValidPassword(password: password)) {
                            NavigationLink(destination: RecipeListView()) {                     Text("Send")
                                    .padding()
                                    .frame(width: 300, height: 50)
                                    .background(Color("vertMoyen").opacity(0.9).cornerRadius(15))
                                    .foregroundColor(Color.white)
                            }
                        }
                        if (isValidEmail(email: email) == false || isValidPassword(password: password) == false) {
                            Text("Send")
                                .padding()
                                .frame(width: 300, height: 50)
                                .background(Color
                                    .gray.opacity(0.9).cornerRadius(15))
                                .foregroundColor(Color.white)
                        }
                    }
                }
            }
        }
    }
}
struct SignUpView_Previews: PreviewProvider {
//        static let userVM = UserVM()
        static let recipeVM = RecipeVM()
        static var previews: some View {
            SignUpView()
                .environmentObject(recipeVM)
        }
}

/*  VStack {
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
 }*/
