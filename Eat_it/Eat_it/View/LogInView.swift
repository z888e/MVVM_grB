//
//  LogInView.swift
//  Eat_it
//
//  Created by Cynthia on 07/11/2022.
//

import SwiftUI

struct LogInView: View {
    @EnvironmentObject var userVM: UserVM
    @State var email = ""
    @State var password = ""
    var body: some View {
        NavigationView {
            ZStack {
                Color("vertFonce").opacity(0.9)
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                   .scale(1.35)
                   .foregroundColor(.white)
                
                VStack {
                    Text("Log In")
                        .foregroundColor(Color("vertFonce"))
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("Email", text: $email)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color(.black).opacity(0.05))
                        .cornerRadius(15)
                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(lineWidth: 1).foregroundColor(Color.black.opacity(0.3)))
                    TextField("Password", text: $email)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color(.black).opacity(0.05))
                        .cornerRadius(15)
                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(lineWidth: 1).foregroundColor(Color.black.opacity(0.3)))
                    
                    Button {
                        Task {
                            //                        UserVM.users = try await UserVM.postUser(email: email, password: password)
                        }
                        Task {
                            email = ""
                            password = ""
                        }
                    } label: {
                            Text("Send")
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color("vertMoyen").opacity(0.9).cornerRadius(15))
                            .foregroundColor(Color.white)
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
