//
//  ContentView.swift
//  Eat_it
//
//  Created by Zoé Hartman on 04/11/2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            HomeView()
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
