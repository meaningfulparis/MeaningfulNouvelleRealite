//
//  GameHeader.swift
//  NouvelleRealite
//
//  Created by Romain Penchenat on 15/09/2020.
//

import SwiftUI

struct GameHeader: View {
    
    let title:String
    @ObservedObject var gameTimer:GameTimer
    
    var body: some View {
        HStack(alignment: .top, content: {
            Text(title).modifier(SubTitle(color: .nrSkin))
            Spacer()
            HStack {
                Text(gameTimer.durationDisplay).modifier(BodyM(color: .nrSkin))
                Image(systemName: "hourglass")
            }
        })
        .padding(32)
        .foregroundColor(Color.nrSkin)
        .background(Color.nrBluePrimary.edgesIgnoringSafeArea(.top))
    }
}

struct GameHeader_Previews: PreviewProvider {
    
    static let gameTimer = GameTimer()
    static var previews: some View {
        GameHeader(title: "Game name", gameTimer: gameTimer)
    }
    
}