//
//  ContentView.swift
//  EmocionaMente
//
//  Created by CLP on 15/04/23.
//

import SwiftUI
import RealityKit
import ARKit

var arView: ARView!

struct ContentView : View {
    
    func TakeSnapshot() {
      // 1
      arView.snapshot(saveToHDR: false) { (image) in
        // 2 Reduce the image size
        let compressedImage = UIImage(
          data: (image?.pngData())!)
        // 3
        UIImageWriteToSavedPhotosAlbum(
          compressedImage!, nil, nil, nil)
      }
    }
    
    var body: some View {
        //Text("Emociona Mente")
        ARViewContainer().edgesIgnoringSafeArea(.all)
          Button(action: {
              self.TakeSnapshot()
          }) {
              Image(systemName: "trash")
                      .font(.largeTitle)
                      .foregroundColor(.red)
                      .clipShape(Circle())
          }

    }
}

// two-way connection between  the property that stores the data and the view that changes and displays the data.


struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        //let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        //arView.scene.anchors.append(boxAnchor)
        
        let arAnchor = try! Experience.loadGlasses()
        arView.scene.anchors.append(arAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        // 1
        let arConfiguration = ARFaceTrackingConfiguration()
        // 2
        uiView.session.run(arConfiguration,
          options:[.resetTracking, .removeExistingAnchors])

    }
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
