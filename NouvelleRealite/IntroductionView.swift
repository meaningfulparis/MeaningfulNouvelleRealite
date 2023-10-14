//
//  IntroductionView.swift
//  NouvelleRealite
//
//  Created by Romain Penchenat on 25/09/2020.
//

import SwiftUI

struct IntroductionView: View {
    
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    
    let challenges:[Challenge] = [
        Challenge(type: .reproduction, name: "Composition", artist: "Piet Mondrian", color: .nrSun, previewFileName: "composition.usdz", sceneAR: try! CompositionMondrian.loadBox()),
        Challenge(type: .reproduction, name: "Chaise Rietveld", artist: "Gerrit Rietveld", color: .nrRiver, previewFileName: "composition.usdz", sceneAR: try! MaisonParticuliere.loadBox()),
        Challenge(type: .creation, name: "L'ovoïde", artist: "Georges Vantongerloo", color: .nrRedPrimary, previewFileName: "composition.usdz", sceneAR: try! CompositionMondrian.loadBox()),
    ]
    
    @ObservedObject var game:Game
    
    var body: some View {
        HStack(alignment: .top){
            VStack(spacing: 0) {
                Header()
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0) {
                        HStack(alignment: .top, spacing: 0) {
                            Circle()
                                .trim(from: 0, to: 0.5)
                                .frame(width: 63, height: 63)
                                .foregroundColor(.nrRiver)
                                .transformEffect(.init(translationX: 0, y: -16))
                        }
                        .frame(idealWidth: .infinity, maxWidth: .infinity, idealHeight: 31, maxHeight: 31)
                        ForEach(challenges) { challenge in
                            ChallengeCard(challenge: challenge, tapHandler: tapOnChallengeCardAction)
                        }
                    }
                }
            }
        }
    }
    
    func tapOnChallengeCardAction(_ challenge:Challenge) {
        game.selectedChallenge = challenge
        Task {
            let result = await openImmersiveSpace(id: NouvelleRealiteApp.GameSpace)
            if case .error = result {
                print("An error occurred")
            }
        }
    }
}

struct IntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionView(game: Game())
    }
}
