//
//  PlaySound.swift
//  EmocionaMente
//
//  Created by Eduardo Jair Hernández Gómez on 17/04/23.
//

import Foundation
import AVFoundation

var player: AVAudioPlayer!

func playSound(audio: String){
    let url = Bundle.main.url(forResource: audio, withExtension: "wav")
    
    guard url != nil else {
        return
    }
    
    do {
        player = try AVAudioPlayer(contentsOf: url!)
        player?.play()
    }catch{
        print("error")
    }
}
