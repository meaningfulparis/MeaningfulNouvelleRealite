//
//  GameAROverlay.swift
//  NouvelleRealite
//
//  Created by Romain Penchenat on 15/09/2020.
//

import SwiftUI

struct GameAROverlay: View {
    
    @ObservedObject var game:Game
    
    var body: some View {
        VStack {
            if !game.hasWin {
                HelpBlock(type: .ARMode)
            }
            Spacer()
            ScanBlock(game: game)
        }
        .padding(EdgeInsets(top: 24, leading: 32, bottom: 24, trailing: 32))
    }
}

struct GameAROverlay_Previews: PreviewProvider {
    static var previews: some View {
        GameAROverlay(game: Game())
    }
}
