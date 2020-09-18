//
//  GameView.swift
//  NouvelleRealite
//
//  Created by Romain Penchenat on 15/09/2020.
//

import SwiftUI

struct GameView: View {
    
    @State var isPlaying:Bool = false
    @ObservedObject var standModeDetector = StandModeDetector()
    @ObservedObject var gameTimer = GameTimer()
    @ObservedObject var game = Game()
    
    var body: some View {
        HStack(alignment: .top){
            VStack(spacing: 0) {
                GameHeader(title: "Composition II", gameTimer: gameTimer)
                ZStack {
                    Color.nrSkin.edgesIgnoringSafeArea(.bottom)
                    if isPlaying {
                        GameARView(game: game)
                        if standModeDetector.isInStandMode {
                            Color.nrSkin.edgesIgnoringSafeArea(.bottom)
                            GameStandView(gameTimer: gameTimer)
                        } else {
                            GameAROverlay(game: game)
                        }
                    } else {
                        GameIntroductionView(startAction: {
                            print("-> play")
                            isPlaying = true
                        })
                    }
                }
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
