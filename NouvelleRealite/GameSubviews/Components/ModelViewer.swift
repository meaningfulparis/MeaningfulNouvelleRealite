////
////  ModelViewer.swift
////  NouvelleRealite
////
////  Created by Romain Penchenat on 18/09/2020.
////
//
//#if os(iOS)
//import SwiftUI
//import RealityKit
//import ARKit
//
//struct ModelViewer: UIViewRepresentable {
//    
//    @ObservedObject var game:Game
//    
//    private let sceneView = SCNView(frame: .zero)
//    
//    func makeUIView(context: Context) -> SCNView {
//        
//        // Load composition scene
//        let mainScene = SCNScene()
//        // Light 1
//        let lightNode = SCNNode()
//        lightNode.light = SCNLight()
//        lightNode.light?.type = .omni
//        lightNode.position = SCNVector3(x: 0, y: 0, z: 20)
//        mainScene.rootNode.addChildNode(lightNode)
//        
//        // Ambient light
//        let ambientLightNode = SCNNode()
//        ambientLightNode.light = SCNLight()
//        ambientLightNode.light?.type = .ambient
//        ambientLightNode.light?.intensity = 600
//        ambientLightNode.light?.color = UIColor.lightGray
//        mainScene.rootNode.addChildNode(ambientLightNode)
//        
//        // Object
//        let previewModelNode = SCNScene(named: "composition.usdz")!.rootNode
//        previewModelNode.name = "previewModel"
//        mainScene.rootNode.addChildNode(previewModelNode)
//        
//        // Camera
//        let cameraNode = SCNNode()
//        cameraNode.camera = SCNCamera()
//        cameraNode.position = SCNVector3(x: 0, y: 0, z: 11)
//        mainScene.rootNode.addChildNode(cameraNode)
//        
//        // Interactions
//        sceneView.allowsCameraControl = true
//        sceneView.cameraControlConfiguration.allowsTranslation = false
//        
//        sceneView.backgroundColor = UIColor(named: "Skin")
////        sceneView.showsStatistics = true
//        sceneView.scene = mainScene
//        
//        return sceneView
//    }
//    
//    func updateUIView(_ uiView: SCNView, context: Context) {
////        if game.timerValue == 0 && game.durationDisplay == "00:00" {
////            print("=> introduction")
////            let spin = CABasicAnimation(keyPath: "rotation")
////            spin.fromValue = SCNVector4(0, 0, 0, Float.pi/2)
////            spin.toValue = SCNVector4(0, 0, 0, 0)
//////            // Use from-to to explicitly make a full rotation around z
//////            spin.fromValue = NSValue(scnVector4: SCNVector4(x: 0, y: 0, z: 0, w: 0))
//////            spin.toValue = NSValue(scnVector4: SCNVector4(x: 0, y: 0, z: 0, w: .pi))
////            spin.duration = 3
////            spin.repeatCount = .infinity
////            let previewModel = uiView.scene?.rootNode.childNode(withName: "previewModel", recursively: false)
//////            previewModel?.addAnimation(spin, forKey: "introspin")
////            sceneView.scene?.rootNode.rotation = SCNVector4(0, 0, 0, Float.pi * 2)
////        }
//    }
//    
//}
//
//#if DEBUG
//struct ModelViewer_Previews : PreviewProvider {
//    static var previews: some View {
//        ModelViewer(game: Game())
//    }
//}
//#endif
//#endif
