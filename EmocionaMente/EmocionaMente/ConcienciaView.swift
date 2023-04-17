//  ConcienciaView.swift
//  EmocionaMente
//
//  Created by Eduardo salazar on 15/04/23.

import SwiftUI
import AVFAudio

struct SoundModel{
    let name: String
    
    func getURL()-> URL {
        return URL(string: Bundle.main.path(forResource: name, ofType: "mp3")!)!
    }
}



struct ConcienciaView: View {
    @StateObject var nivelDifVM = NivelesViewModel()
    @State var player: AVAudioPlayer?
    //player = try! AVAudioPlayer(contentsOF: "EmocionaMenteTheme".getURL())
    
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack{
                VStack{
                    Text("EmocionaMente")
                        .font(.title)
                        .bold()
                        .foregroundColor(Color(red: 40/255, green: 40/255, blue: 40/255))
                    
                    VStack{
                        NavigationLink(destination: DiferenciarView(nivel: nivelDifVM.arrNivelesDif[0]), label: {
                            HStack{
                                Image("ola")
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(5.0)
                                    .frame(minWidth: 100)
                                VStack{
                                    Text("Juego diferenciar")
                                        .bold()
                                        .foregroundColor(.white)
                                        .padding()
                                    
                                    Button(action: {
                                        
                                    }){
                                        Image(systemName: "speaker.wave.3.fill")
                                            .renderingMode(.original)
                                            .foregroundColor(.white)
                                    }
                                }
                                
                            }
                        
                    })
                    .frame(
                        minWidth: 300,
                        maxWidth: 300,
                        minHeight: 150
                    )
                    .background(Color(red: 67/255, green: 112/255, blue: 242/255))
                    .foregroundColor(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .shadow(color: .gray, radius: 4)
                    .scaledToFit()
                        
                        NavigationLink(destination: FacePaintingARView(), label: {
                            HStack{
                                Image("ola")
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(5.0)
                                    .frame(minWidth: 100)
                                VStack{
                                    Text("Juego identificar")
                                        .bold()
                                        .foregroundColor(.white)
                                        .padding()
                                    
                                    Button(action: {
                                        
                                    }){
                                        Image(systemName: "speaker.wave.3.fill")
                                            .renderingMode(.original)
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                        })
                        .frame(
                            minWidth: 300,
                            maxWidth: 300,
                            minHeight: 150
                        )
                        .background(Color(red: 255/255, green: 87/255, blue: 87/255))
                        .foregroundColor(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .shadow(color: .gray, radius: 4)
                        .scaledToFit()
                        
                    }
                }
            }
        } else {
            // Fallback on earlier versions
        }
    }
}

struct ConcienciaView_Previews: PreviewProvider {
    static var previews: some View {
        ConcienciaView()
    }
}
