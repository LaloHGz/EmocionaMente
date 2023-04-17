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
                            VStack{
                                
                                Text("Juego diferenciar")
                                    .bold()
                                    .foregroundColor(.black)
                                    .padding()
                            }
                        })
                        .frame(
                            maxWidth: 300,
                            minHeight: 150
                        )
                        .background(Color(red: 189/255, green: 200/255, blue: 88/255))
                        .foregroundColor(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .padding()
                        
                        NavigationLink(destination: FacePaintingARView(), label: {
                            HStack{
                                Text("Juego identificar")
                                    .bold()
                                    .foregroundColor(.black)
                                    .padding()
                            }
                        })
                        .frame(
                            maxWidth: 300,
                            minHeight: 150
                        )
                        .background(Color(red: 189/255, green: 200/255, blue: 88/255))
                        .foregroundColor(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        
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
