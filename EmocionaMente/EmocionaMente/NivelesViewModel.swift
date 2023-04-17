//
//  NivelesViewModel.swift
//  EmocionaMente
//
//  Created by Eduardo salazar on 16/04/23.
//

import UIKit
import SwiftUI

class NivelesViewModel: ObservableObject {

    @Published var arrNivelesDif = [NivelDifModel]()
    
    init(){
            getNivelesD()
    }
    func getNivelesD() {
            
            var nivel : NivelDifModel
            
            
        nivel = NivelDifModel(titulo: "Emociones", descripcion: "¿Son iguales las emociones?", emocion1: "2", emocion2: "3", resp1: false, resp2: true, nivelA: 0.0, nivelSig: 2)
            arrNivelesDif.append(nivel)
        
        nivel = NivelDifModel(titulo: "Emociones", descripcion: "¿Son iguales las emociones?", emocion1: "5", emocion2: "5", resp1: true, resp2: false, nivelA: 1.0, nivelSig: 2)
            arrNivelesDif.append(nivel)
        
        nivel = NivelDifModel(titulo: "Emociones", descripcion: "¿Son iguales las emociones?", emocion1: "5", emocion2: "2", resp1: false, resp2: true, nivelA: 2.0, nivelSig: 3)
            arrNivelesDif.append(nivel)
        
        nivel = NivelDifModel(titulo: "Emociones", descripcion: "¿Son iguales las emociones?", emocion1: "7", emocion2: "6", resp1: false, resp2: true, nivelA: 3.0, nivelSig: 4)
            arrNivelesDif.append(nivel)
        
        
        nivel = NivelDifModel(titulo: "Emociones", descripcion: "¿Son iguales las emociones?", emocion1: "2", emocion2: "6", resp1: false, resp2: true, nivelA: 4.0, nivelSig: 5)
            arrNivelesDif.append(nivel)
        
            nivel = NivelDifModel(titulo: "Emociones", descripcion: "¿Son iguales las emociones?", emocion1: "5", emocion2: "6", resp1: false, resp2: true, nivelA: 5.0, nivelSig: 0)
            arrNivelesDif.append(nivel)

        
            
        
    }
}
