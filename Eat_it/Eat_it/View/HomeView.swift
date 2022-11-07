//
//  HomeView.swift
//  Eat_it
//
//  Created by Cynthia on 07/11/2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    LogInView()
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 50).frame(width: 150, height: 70).foregroundColor(Color.green).padding()
                        Text("Login").foregroundColor(Color.white)
                    }.padding()
                }
                NavigationLink {
                    SignUpView()
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 50).frame(width: 150, height: 70).foregroundColor(Color.green).padding()
                        Text("Sign Up").foregroundColor(Color.white)
                    }.padding()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
