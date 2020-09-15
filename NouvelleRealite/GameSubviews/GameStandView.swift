//
//  GameStandView.swift
//  NouvelleRealite
//
//  Created by Romain Penchenat on 15/09/2020.
//

import SwiftUI

struct GameStandView: View {
    
    @ObservedObject var gameTimer:GameTimer
    
    var body: some View {
        VStack {
            HelpBlock(type: .StandMode)
            Spacer()
            Text(gameTimer.durationDisplay)
                .font(.title)
            Spacer()
            Button("J'ai perdu la mémoire !") {
                print("give help")
            }.buttonStyle(PrimaryButtonStyle(color: .nrRedPrimary))
        }.padding(EdgeInsets(top: 24, leading: 32, bottom: 24, trailing: 32))
    }
}

struct GameStandView_Previews: PreviewProvider {
    
    static let gameTimer = GameTimer()
    static var previews: some View {
        GameStandView(gameTimer: gameTimer)
    }
    
}
