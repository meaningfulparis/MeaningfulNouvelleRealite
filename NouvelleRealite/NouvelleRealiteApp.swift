//
//  NouvelleRealiteApp.swift
//  NouvelleRealite
//
//  Created by Romain Penchenat on 13/10/2023.
//

import SwiftUI

@main
struct NouvelleRealiteApp: App {
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .defaultSize(width: 600, height: 1000)
        .windowResizability(.contentSize)
        
        WindowGroup(id: "reality-preview") {
            ModelPreview()
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 0.5, height: 0.5, depth: 0.25, in: .meters)

//        ImmersiveSpace(id: "ImmersiveSpace") {
//            ImmersiveView()
//        }.immersionStyle(selection: .constant(.progressive), in: .progressive)
    }
}
