//
//  ModelPreview.swift
//  NouvelleRealite
//
//  Created by Romain Penchenat on 13/10/2023.
//

import SwiftUI
import RealityKit
import SceneKit

struct ModelPreview: View {
    var body: some View {
        RealityView { content in
            if let item = try? await ModelEntity(named: "composition.usdz") {
                item.transform.scale = [0.05, 0.05, 0.05]
//                item.components.set(InputTargetComponent())
//                item.components.set(CollisionComponent(shapes: [.generateBox(width: 0.5, height: 0.5, depth: 0.25)]))
                content.add(item)
            }
        }
    }
}

#Preview {
    ModelPreview()
}
