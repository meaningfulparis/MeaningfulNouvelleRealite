//
//  GameView.swift
//  NouvelleRealite
//
//  Created by Romain Penchenat on 15/09/2020.
//

import SwiftUI

struct GameView: View {
    
    
    @Environment(\.dismissWindow) private var dismissWindow
    
    @StateObject var standModeDetector = StandModeDetector()
    @ObservedObject var game:Game
    
    var body: some View {
        HStack(alignment: .top){
            VStack(spacing: 0) {
                GameHeader(title: game.selectedChallenge?.name ?? "error", game: game)
                ZStack {
                    Color.nrSkin.edgesIgnoringSafeArea(.bottom)
                    if game.state == .introduction || game.state == .introductionTimer {
                        if game.state == .introductionTimer {
                            GameIntroductionTimerView(game: game)
                        } else {
                            GameIntroductionView(game: game, startAction: {
                                game.state = .playing
                                #if os(visionOS)
                                dismissWindow(id: NouvelleRealiteApp.PreviewWindow)
                                #endif
                            })
                        }
                    } else {
                        #if os(visionOS)
                        GameStandView(game: game)
                        #else
//                        GameARView(game: game)
                        if !game.hasWin && (standModeDetector.isInStandMode || game.memoryHelpIsDisplayed) {
                            Color.nrSkin.edgesIgnoringSafeArea(.bottom)
                            GameStandView(game: game)
                        } else {
                            GameAROverlay(game: game)
                        }
                        #endif
                    }
                    SuccessOverlay(game: game)
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
