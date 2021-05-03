//
//  GameView.swift
//  NouvelleRealite
//
//  Created by Romain Penchenat on 15/09/2020.
//

import SwiftUI

struct GameView: View {
    
    @StateObject var standModeDetector = StandModeDetector()
    @ObservedObject var game:Game
    
    var body: some View {
        HStack(alignment: .top){
            VStack(spacing: 0) {
                GameHeader(title: game.selectedChallenge!.name, game: game)
                ZStack {
                    Color.nrSkin.edgesIgnoringSafeArea(.bottom)
                    if game.state == .introduction {
                        GameIntroductionView(startAction: {
                            game.state = .playing
                        })
                    } else {
                        GameARView(game: game)
                        if !game.hasWin && (standModeDetector.isInStandMode || game.memoryHelpIsDisplayed) {
                            Color.nrSkin.edgesIgnoringSafeArea(.bottom)
                            GameStandView(game: game)
                        } else {
                            GameAROverlay(game: game)
                        }
                    }
                }
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(game: Game())
    }
}
