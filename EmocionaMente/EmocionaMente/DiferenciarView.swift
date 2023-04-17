//
//  DiferenciarView.swift
//  EmocionaMente
//
//  Created by Eduardo salazar on 15/04/23.
//

import SwiftUI

struct DiferenciarView: View {
    let nivel : NivelDifModel
    @StateObject var nivelDifVM = NivelesViewModel()
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack{
                VStack{
                    
                    Text(nivel.titulo)
                        .font(.title)
                        .bold()
                        .foregroundColor(Color(red: 40/255, green: 40/255, blue: 40/255))
                        .frame(alignment: .top)
                        .padding(.init(top: 20, leading: 20, bottom: 0, trailing: 20))
                    VStack{
                        VStack{
                            ProgressView("", value: nivel.nivelA, total: 10)
                                .tint(.orange)
                        }
                        .padding(.init(top: 0, leading: 20, bottom: 20, trailing: 20))
                        
                        HStack{
                            // pregunta
                            Text(nivel.descripcion)
                                .font(.title3)
                                .bold()
                                .foregroundColor(Color(red: 40/255, green: 40/255, blue: 40/255))
                            // boton audio
                            Button(action: {
                                print("button pressed")
                                playSound(audio: "son-iguales-las-emociones")
                            }){
                                Image(systemName: "speaker.wave.3.fill")
                                    .renderingMode(.original)
                            }
                            
                        }
                    }
                    .padding(.init(top: 0, leading: 20, bottom: 20, trailing: 20))
                    
                    VStack{
                        HStack{
                            Image(nivel.emocion1)
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(5.0)
                                .frame(minWidth: 200)
                            
                            Image(nivel.emocion2)
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(5.0)
                                .frame(minWidth: 200)
                        }
                        HStack{
                            Button(action: {
                                print("button pressed")
                                
                            }){
                                Image(systemName: "checkmark.seal.fill")
                                    .renderingMode(.original)
                                    .foregroundColor(Color(red: 157/255, green: 205/255, blue: 90/255))
                                    .font(.system(size: 60))
                            }
                            
                            VStack{
                                Button(action: {
                                    print("button pressed")
                                    
                                }){
                                    Image(systemName: "xmark.seal.fill")
                                        .renderingMode(.original)
                                        .foregroundColor(Color(red: 255/255, green: 87/255, blue: 87/255))
                                        .font(.system(size: 60))
                                }
                                Image(systemName: "hand.tap")
                                    .renderingMode(.original)
                                    .foregroundColor(Color(red: 255/255, green: 87/255, blue: 87/255))
                                    .font(.system(size: 60))
                            }
                            .padding()
                        }
                    }
                    
                    NavigationLink(destination: DiferenciarDetailView(nivel: nivelDifVM.arrNivelesDif[1]), label: {
                        VStack{
                            
                            Text("Jugar")
                                .bold()
                                .foregroundColor(.white)
                                .padding(.init(top: 30, leading: 120, bottom: 30, trailing: 120))
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
                    
                    
                } // finalVS
                .frame(maxHeight: .infinity, alignment: .center)
                
            }
            .toolbar(.hidden, for: .tabBar)
        } else {
            // Fallback on earlier versions
        }
        
    }
    
    
    
    
}

struct DiferenciarView_Previews: PreviewProvider {
    static var previews: some View {
        DiferenciarView(nivel : NivelDifModel.defaultNivel)
    }
}
