//
//  NivelesDifModel.swift
//  EmocionaMente
//
//  Created by Eduardo salazar on 16/04/23.
//

import Foundation


struct NivelDifModel : Identifiable {
    var id = UUID()
    var titulo : String
    var descripcion : String
    var emocion1 : String
    var emocion2 : String
    var resp1 : Bool
    var resp2 : Bool
    var nivelA: Double
    var nivelSig: Int
}

extension NivelDifModel {
    
    public static var defaultNivel = NivelDifModel(titulo: "Emociones", descripcion: "¿Son iguales las emociones?", emocion1: "2", emocion2: "3", resp1: false, resp2: true, nivelA: 1.0, nivelSig: 2)
    
    
}
