//
//  NouvelleRealiteApp.swift
//  NouvelleRealite
//
//  Created by Romain Penchenat on 13/10/2023.
//

import SwiftUI

@main
struct NouvelleRealiteApp: App {
    
    static let PreviewWindow = "reality-preview"
    static let GameSpace = "game-immersive-space"
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .defaultSize(width: 600, height: 1000)
        .windowResizability(.contentSize)
        
        #if os(visionOS)
        WindowGroup(id: NouvelleRealiteApp.PreviewWindow) {
            ModelPreview()
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 0.5, height: 0.5, depth: 0.25, in: .meters)
        
        ImmersiveSpace(id: NouvelleRealiteApp.GameSpace) {
            GameImmersiveView()
        }
        .immersionStyle(selection: .constant(.mixed), in: .mixed)
        #endif
    }
    
}
