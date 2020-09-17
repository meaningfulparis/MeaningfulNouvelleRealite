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
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    private let arView = NRARView(frame: .zero)
    
    func makeUIView(context: Context) -> ARView {
        
        // Load the "Box" scene from the "Experience" Reality File
        let compositionAnchor = try! Composition.loadBox()
        let maisonAnchor = try! MaisonParticuliere.loadBox()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(compositionAnchor)
        arView.scene.anchors.append(maisonAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

class NRARView : ARView, ARSessionDelegate {
    
    required init(frame frameRect: CGRect) {
        super.init(frame: .zero)
        self.session.delegate = self
    }
    
    @objc required dynamic init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
        print("\n-> add anchors")
        print(anchors)
    }
    
    func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
        print("\n-> update anchors")
        print(anchors)
    }
    
    func session(_ session: ARSession, didRemove anchors: [ARAnchor]) {
        print("\n-> remove anchors")
        print(anchors)
    }
    
}

#if DEBUG
struct GameARView_Previews : PreviewProvider {
    static var previews: some View {
        GameARView()
    }
}
#endif
