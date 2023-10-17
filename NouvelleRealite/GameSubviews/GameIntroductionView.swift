//
//  GameIntroductionView.swift
//  NouvelleRealite
//
//  Created by Romain Penchenat on 15/09/2020.
//

import SwiftUI
import RealityKit

struct GameIntroductionView: View {
    
    @Environment(\.openWindow) private var openWindow
    
    @ObservedObject var game:Game
    
    let startAction:() -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 24) {
                Text("Mémorisez le tableau")
                    .modifier(Title(color: .nrRedPrimary))
                Text("Puis construisez grâce à votre mémoire")
                    .modifier(Title(color: .nrBluePrimary))
            }
            .padding(EdgeInsets(top: 0, leading: 32, bottom: 0, trailing: 32))
            #if os(iOS)
            ModelViewer(game: game)
            #else
            Spacer()
            #endif
            HStack() {
                Spacer()
                Button("3, 2, 1, C'est parti !", action: startAction)
                    .buttonStyle(PrimaryButtonStyle())
                Spacer()
            }
        }
        .padding(EdgeInsets(top: 24, leading: 0, bottom: 24, trailing: 0))
        .onAppear {
            #if os(visionOS)
            openWindow(id: NouvelleRealiteApp.PreviewWindow)
            #endif
        }
    }
}

struct GameIntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        GameIntroductionView(game: Game(), startAction: {
            print("gooooo")
        })
    }
}
