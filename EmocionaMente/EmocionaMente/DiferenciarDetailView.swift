//
//  DiferenciarDetailView.swift
//  EmocionaMente
//
//  Created by Eduardo salazar on 16/04/23.
//

import SwiftUI

struct DiferenciarDetailView: View {
    var nivel : NivelDifModel
    
    @StateObject var nivelDifVM = NivelesViewModel()
    @State private var respVerde = false
    @State private var respRoja = false
    
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
                            ProgressView("", value: nivel.nivelA, total: 6)
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
                                
                            }){
                                Image(systemName: "speaker.wave.3.fill")
                                    .renderingMode(.original)
                            }
                            
                        }
                    }
                    .padding(.init(top: 0, leading: 20, bottom: 20, trailing: 20))
                    
                    HStack{
                        VStack{
                            Image(nivel.emocion1)
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(5.0)
                                .frame(minWidth: 200)
                            /*
                             Button(action: {
                             respVerde.toggle()
                             
                             }){
                             Image(systemName: "checkmark.seal.fill")
                             .renderingMode(.original)
                             .foregroundColor(Color(red: 157/255, green: 205/255, blue: 90/255))
                             .font(.system(size: 60))
                             }
                             if respVerde && nivel.resp1{
                             // si presionaron el verde y es correcto
                             NavigationLink("", destination:  ConcienciaView(), isActive: $respVerde)
                             }
                             else{
                             // si presionaron el verde y es incorrecto
                             }
                             */
                            if nivel.resp1 && nivel.nivelSig != 0{
                                NavigationLink(destination: DiferenciarDetailView(nivel: nivelDifVM.arrNivelesDif[nivel.nivelSig]), label: {
                                    VStack{
                                        Image(systemName: "checkmark.seal.fill")
                                            .renderingMode(.original)
                                            .foregroundColor(Color(red: 157/255, green: 205/255, blue: 90/255))
                                            .font(.system(size: 60))
                                    }
                                })
                            }
                            else{
                                Button(action: {
                                    respVerde.toggle()
                                    
                                }){
                                    Image(systemName: "checkmark.seal.fill")
                                        .renderingMode(.original)
                                        .foregroundColor(Color(red: 157/255, green: 205/255, blue: 90/255))
                                        .font(.system(size: 60))
                                }
                            }
                        }
                        
                        VStack{
                            Image(nivel.emocion2)
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(5.0)
                                .frame(minWidth: 200)
                            
                            /*
                             Button(action: {
                             respRoja.toggle()
                             
                             }){
                             Image(systemName: "xmark.seal.fill")
                             .renderingMode(.original)
                             .foregroundColor(Color(red: 255/255, green: 87/255, blue: 87/255))
                             .font(.system(size: 60))
                             }
                             if respRoja && nivel.resp2{
                             // si presionaron el verde y es correcto
                             NavigationLink(destination: DiferenciarView(nivel: nivelDifVM.arrNivelesDif[3]), label: {
                             
                             })
                             }
                             else{
                             // si presionaron el verde y es incorrecto
                             }
                             */
                            
                            if nivel.resp2 && nivel.nivelSig != 0{
                                NavigationLink(destination: DiferenciarDetailView(nivel: nivelDifVM.arrNivelesDif[nivel.nivelSig]), label: {
                                    VStack{
                                        Image(systemName: "xmark.seal.fill")
                                            .renderingMode(.original)
                                            .foregroundColor(Color(red: 255/255, green: 87/255, blue: 87/255))
                                            .font(.system(size: 60))
                                    }
                                })
                            }
                            else if nivel.resp2 && nivel.nivelSig == 0 {
                                NavigationLink(destination: GlosarioView(), label: {
                                    VStack{
                                        Image(systemName: "xmark.seal.fill")
                                            .renderingMode(.original)
                                            .foregroundColor(Color(red: 255/255, green: 87/255, blue: 87/255))
                                            .font(.system(size: 60))
                                    }
                                })
                            }
                            else{
                                Button(action: {
                                    respRoja.toggle()
                                    
                                }){
                                    Image(systemName: "xmark.seal.fill")
                                        .renderingMode(.original)
                                        .foregroundColor(Color(red: 255/255, green: 87/255, blue: 87/255))
                                        .font(.system(size: 60))
                                }
                            }
                        }
                        
                    }//HS
                    .frame(minWidth: 400, minHeight: 300)
                    .padding()
                    
                    /*
                     Text("Son iguales -- Son diferentes aki algo que indique que esta bien o no o yo k se")
                     .padding()
                     */
                    
                } // finalVS
                .frame(maxHeight: .infinity, alignment: .center)
                
            }
            .toolbar(.hidden, for: .tabBar)
        } else {
            // Fallback on earlier versions
        }
    }
}

struct DiferenciarDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DiferenciarDetailView(nivel : NivelDifModel.defaultNivel)
    }
}
