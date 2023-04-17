//
//  ContentView.swift
//  EmocionaMente
//
//  Created by CLP on 15/04/23.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        //Text("Emociona Mente")
        FacePaintingARView()
    }
}


#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
