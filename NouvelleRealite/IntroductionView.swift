//
//  IntroductionView.swift
//  NouvelleRealite
//
//  Created by Romain Penchenat on 25/09/2020.
//

import SwiftUI

struct IntroductionView: View {
    
    let challenges:[Challenge] = [
        Challenge(type: .reproduction, name: "Reproduction II", color: .nrSun, previewFileName: "composition.usdz", sceneAR: try! CompositionMondrian.loadBox()),
        Challenge(type: .reproduction, name: "Maison particulière", color: .nrRiver, previewFileName: "composition.usdz", sceneAR: try! MaisonParticuliere.loadBox()),
        Challenge(type: .creation, name: "L'ovoïde", color: .nrRedPrimary, previewFileName: "composition.usdz", sceneAR: try! CompositionMondrian.loadBox()),
    ]
    
    @ObservedObject var game:Game
    
    var body: some View {
        HStack(alignment: .top){
            VStack(spacing: 0) {
                Header()
                ScrollView(showsIndicators: false) {
                    VStack {
                        ForEach(challenges) { challenge in
                            ChallengeCard(challenge: challenge, tapHandler: tapOnChallengeCardAction)
                        }
                    }
                }
            }
        }
    }
    
    func tapOnChallengeCardAction(_ challenge:Challenge) {
        print(challenge)
        game.selectedChallenge = challenge
    }
}

struct IntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionView(game: Game())
    }
}
