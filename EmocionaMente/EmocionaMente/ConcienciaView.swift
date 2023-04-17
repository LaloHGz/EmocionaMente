//  ConcienciaView.swift
//  EmocionaMente
//
//  Created by Eduardo salazar on 15/04/23.

import SwiftUI


struct ConcienciaView: View {
    @StateObject var nivelDifVM = NivelesViewModel()
    
    var body: some View {
        Text("Hola")
    }
}

struct ConcienciaView_Previews: PreviewProvider {
    static var previews: some View {
        ConcienciaView()
    }
}


