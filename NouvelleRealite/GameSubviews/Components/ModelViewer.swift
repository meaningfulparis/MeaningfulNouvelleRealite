//
//  ModelViewer.swift
//  NouvelleRealite
//
//  Created by Romain Penchenat on 18/09/2020.
//

import SwiftUI
import RealityKit
import ARKit

struct ModelViewer: UIViewRepresentable {
    
    private var sceneView = SCNView(frame: .zero)
    
    func makeUIView(context: Context) -> SCNView {
        
        // Load composition scene
        let scene = SCNScene(named: "composition.usdz")!
        
        // Camera
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.look(at: scene.rootNode.position)
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 11)
        scene.rootNode.addChildNode(cameraNode)
        
        // Light 1
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .omni
        lightNode.position = SCNVector3(x: 2, y: 2, z: 20)
        scene.rootNode.addChildNode(lightNode)
        
        // Ambient light
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light?.type = .ambient
        ambientLightNode.light?.intensity = 600
        ambientLightNode.light?.color = UIColor.lightGray
        scene.rootNode.addChildNode(ambientLightNode)
        
        // Interactions
        sceneView.allowsCameraControl = true
        sceneView.defaultCameraController.interactionMode = .orbitTurntable
        sceneView.cameraControlConfiguration.allowsTranslation = false
        
        sceneView.backgroundColor = UIColor(named: "Skin")
//        sceneView.showsStatistics = true
        sceneView.scene = scene
        
        return sceneView
    }
    
    func updateUIView(_ uiView: SCNView, context: Context) {}
    
}

#if DEBUG
struct ModelViewer_Previews : PreviewProvider {
    static var previews: some View {
        ModelViewer()
    }
}
#endif
