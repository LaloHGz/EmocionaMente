//
//  GlosarioView.swift
//  EmocionaMente
//
//  Created by Eduardo salazar on 16/04/23.
//

import SwiftUI

struct GlosarioView: View {
    @State private var selectedColor = Color.white
    let allEmotions: [String] = ["1", "2", "3", "5", "6", "7"]
    let allNames: [String] = ["Sorprendido", "Contento", "Asustado", "Enojado", "Triste", "Disgustado"]
    let adaptiveColumns = [GridItem(.adaptive(minimum: 120, maximum: 200))]

    
    var body: some View {
        
        if #available(iOS 16.0, *) {
            NavigationStack{
                ScrollView {
                    VStack{
                        Text("EmocionaMente")
                            .font(.title)
                            .bold()
                            .foregroundColor(Color(red: 40/255, green: 40/255, blue: 40/255))
                        
                        LazyVGrid(columns: adaptiveColumns) {
                            ForEach(allEmotions.indices, id: \.self) { index in
                                /*
                                 Button {
                                 selectedColor = allEmotions[index]
                                 } label: {
                                 RoundedRectangle(cornerRadius: 4.0)
                                 .aspectRatio(1.0, contentMode: ContentMode.fit)
                                 .foregroundColor(allEmotions[index])
                                 }
                                 */
                                VStack{
                                    Image(allEmotions[index])
                                        .resizable()
                                        .scaledToFit()
                                        .cornerRadius(5.0)
                                    Text(allNames[index])
                                        .frame(alignment: .top)
                                }
                            }
                        }
                        .padding(.init(top: 0, leading: 10, bottom: 40, trailing: 10))
                        
                        NavigationLink(destination: ContentView(), label: {
                            VStack{
                                
                                Text("Finalizar")
                                    .bold()
                                    .foregroundColor(.white)
                                    .padding(.init(top: 30, leading: 100, bottom: 30, trailing: 100))
                            }
                        })
                        .frame(
                            maxWidth: 300,
                            minHeight: 80
                        )
                        .background(Color(red: 67/255, green: 112/255, blue: 242/255))
                        .foregroundColor(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .shadow(color: .gray, radius: 4)
                        .scaledToFit()
                    }
                }
                .padding()
            }
            .toolbar(.hidden, for: .tabBar)
        } else {
            // Fallback on earlier versions
        }
    }
        
}

struct GlosarioView_Previews: PreviewProvider {
    static var previews: some View {
        GlosarioView()
    }
}
