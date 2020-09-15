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
    
    var body: some View {
        HStack(alignment: .top){
            VStack(spacing: 0) {
                GameHeader(title: "Composition II", gameTimer: gameTimer)
                ZStack {
                    Color.nrSkin.edgesIgnoringSafeArea(.bottom)
                    if isPlaying {
                        if standModeDetector.isInStandMode {
                            GameStandView(gameTimer: gameTimer)
                        } else {
                            GameARView().edgesIgnoringSafeArea(.bottom)
                            GameAROverlay()
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
