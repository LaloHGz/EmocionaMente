//
//  DibujoView.swift
//  EmocionaMente
//
//  Created by Eduardo Jair Hernández Gómez on 16/04/23.
//

import SwiftUI
import PencilKit

struct DibujoView: View {
    var body: some View {

        Home()
    }
}

/*struct DibujoView_Previews: PreviewProvider {
    static var previews: some View {
        DibujoView()
    }
}*/


struct Home: View {
    
    @State var canvas = PKCanvasView()
    @State var isdraw = true
    @State var color: Color = .black
    @State var type: PKInkingTool.InkType = .marker
    @State var colorPicker = false
    
    // default is pen
    
    var body: some View {
        
        VStack {
            HStack{
                Text("Dibuja lo que sientes")
                    .font(.system(size: 20))
                    .bold()
                Button(action: {
                
                }) {
                    
                    Image(systemName: "speaker.wave.2.fill")
                        .resizable()
                        .frame(width: 25.0,height: 20.0)
                        .font(.title)
                        .foregroundColor(Color(red: 67/255, green: 112/255, blue: 242/255))
                }
            }
            .padding(20)

            
            NavigationStack {
                // Drawing View......
                DrawingView(canvas: $canvas, isdraw: $isdraw, type: $type, color: $color)
                    .padding(20)
                    .navigationBarItems(leading:
                        
                        Button(action: {
                            if(!isdraw){
                                isdraw.toggle()
                            }
                        
                    }, label: {
                        Image(systemName: "pencil")
                            .font(.title)
                            .foregroundColor(Color(red: 67/255, green: 112/255, blue: 242/255))
                    }), trailing: HStack(spacing: 15) {
                        
                        Button(action: {
                            
                            // erase tool
                            if(isdraw){
                                isdraw.toggle()
                            }
                        
                        }) {
                            
                            Image(systemName: "eraser.fill")
                                .resizable()
                                .frame(width: 25.0, height: 25.0)
                                .font(.title)
                                .foregroundColor(Color(red: 67/255, green: 112/255, blue: 242/255))
                        }
                        
                        ColorPicker("",selection: $color)
                    })
                    .sheet(isPresented: $colorPicker) {
                        
                       ColorPicker("Pick Color", selection: $color)
                        .padding()
                    }
            }
            
            HStack{
                Spacer()
                
                Button(action: {
                    saveImage()
                }, label: {
                    HStack{
                        Text("Enviar")
                            .font(.system(size:20))
                        Image(systemName: "paperplane.fill")
                            .resizable()
                            .frame(width: 25.0, height: 25.0)
                            .font(.title)
                            .foregroundColor(Color(red: 67/255, green: 112/255, blue: 242/255))
                    }.padding(20)

                })
                    .buttonStyle(.bordered)
                    .tint(.blue)
                    .padding(20)
                
                
            }
        }
        
        
    }
    
    func saveImage() {
        
        // getting image from Canvas
        
        let image = canvas.drawing.image(from: canvas.drawing.bounds, scale: 1)
        
        // saving to album
        
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        
        
    }
}

struct DrawingView: UIViewRepresentable {
    // to capture drawings for saving into albums
    @Binding var canvas: PKCanvasView
    @Binding var isdraw: Bool
    @Binding var type: PKInkingTool.InkType
    @Binding var color: Color
    
    
    
    // Updating inktype
    
     var ink : PKInkingTool {
        
        PKInkingTool(type, color: UIColor(color))
    }
    
    let eraser = PKEraserTool(.bitmap)
    
    func makeUIView(context: Context) -> PKCanvasView {
        canvas.backgroundColor = .systemGray6
        canvas.drawingPolicy = .anyInput
        canvas.tool = isdraw ? ink : eraser
        
        return canvas
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        // updating the tool whenever the view updates
        
        uiView.tool = isdraw ? ink : eraser
        
    }
}
