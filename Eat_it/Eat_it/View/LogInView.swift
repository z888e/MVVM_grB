//
//  LogInView.swift
//  Eat_it
//
//  Created by Cynthia on 07/11/2022.
//

import SwiftUI

struct LogInView: View {
    @EnvironmentObject var UserVM: UserViewModel
    @State var email = ""
    @State var password = ""
    var body: some View {

        VStack {
            Text("Login Up")
            ScrollView {
                TextField("Votre email", text: $email, prompt: Text("email")).border(.black, width: 1).padding()
                TextField("Votre mots de passe", text: $password, prompt: Text("Password")).border(.black, width: 1).padding()
                //        }
                Button {
                    Task {
//                        UserVM.users = try await UserVM.postUser(email: email, password: password)
                    }
                    Task {
                        email = ""
                        password = ""
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

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
