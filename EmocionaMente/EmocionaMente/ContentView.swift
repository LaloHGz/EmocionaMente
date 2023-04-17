//
//  ContentView.swift
//  EmocionaMente
//
//  Created by CLP on 15/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ConcienciaView()
               .tabItem {
                   Label("Conciencia", systemImage: "brain")
               }
             
           GlosarioView()
               .tabItem {
                   Label("Regulación", systemImage: "brain.head.profile")
               }
            
       }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
