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
        let mainScene = SCNScene()
        // Light 1
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 0, z: 20)
        mainScene.rootNode.addChildNode(lightNode)
        
        // Ambient light
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light?.type = .ambient
        ambientLightNode.light?.intensity = 600
        ambientLightNode.light?.color = UIColor.lightGray
        mainScene.rootNode.addChildNode(ambientLightNode)
        
        
        let scene = SCNScene(named: "composition.usdz")!
        
        // Camera
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 11)
        scene.rootNode.addChildNode(cameraNode)
        
        // Interactions
        sceneView.allowsCameraControl = true
        sceneView.cameraControlConfiguration.allowsTranslation = false
        
        sceneView.backgroundColor = UIColor(named: "Skin")
//        sceneView.showsStatistics = true
        mainScene.rootNode.addChildNode(scene.rootNode)
        sceneView.scene = mainScene
//        
//        let spin = CABasicAnimation(keyPath: "rotation")
//        // Use from-to to explicitly make a full rotation around z
//        spin.fromValue = NSValue(scnVector4: SCNVector4(x: 0, y: 0, z: 0, w: 0))
//        spin.toValue = NSValue(scnVector4: SCNVector4(x: 0, y: 0, z: 0, w: 2 * .pi))
//        spin.duration = 3
//        spin.repeatCount = 1
//        mainScene.rootNode.addAnimation(spin, forKey: "introspin")
//        
//        print("-> spin")
        
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
