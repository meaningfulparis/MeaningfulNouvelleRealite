//
//  GameImmersiveView.swift
//  NouvelleRealite
//
//  Created by Romain Penchenat on 14/10/2023.
//

import SwiftUI
import RealityKit

#if os(visionOS)
struct GameImmersiveView: View {
    var body: some View {
        RealityView { content in
            if let compositionMondrian = try? CompositionMondrian.loadBox() {
                content.add(compositionMondrian)
            }
            if let maisonParticuliere = try? MaisonParticuliere.loadBox() {
                content.add(maisonParticuliere)
            }
        }
    }
}

#Preview {
    GameImmersiveView()
}
#endif
