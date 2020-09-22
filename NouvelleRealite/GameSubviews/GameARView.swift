//
//  ContentView.swift
//  NouvelleRealite
//
//  Created by Romain Penchenat on 15/09/2020.
//

import SwiftUI
import RealityKit
import ARKit

struct GameARView : View {
    
    @ObservedObject var game:Game
    
    var body: some View {
        ARViewContainer(game: game).edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    @ObservedObject var game:Game
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = NRARView(frame: .zero)
        arView.detectionCallback = {
            self.game.state = .successFeedback
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                self.game.state = .successAudioPlaying
            }
        }
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(try! CompositionMondrian.loadBox())
        arView.scene.anchors.append(try! MaisonParticuliere.loadBox())
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

class NRARView : ARView, ARSessionDelegate {
    
    var detectionCallback:() -> Void = {}
    
    required init(frame frameRect: CGRect) {
        super.init(frame: .zero)
//        #warning("Canvas only")
        self.session.delegate = self
    }
    
    @objc required dynamic init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
        anchors.forEach { (anchor) in
            if anchor is ARImageAnchor {
                self.detectionCallback()
            }
        }
    }
    
}

#if DEBUG
struct GameARView_Previews : PreviewProvider {
    static var previews: some View {
        GameARView(game: Game())
    }
}
#endif
