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
//            if game.state == .playing {
//                HelpBlock(type: .ARMode)
//            }
//            Spacer()
            switch game.state {
            case .successPanel:
                SuccessPanel(game: game)
            case .successStory:
                AudioPlayer(game: game)
            default:
                ScanBlock(game: game)
            }
        }
//        .padding(EdgeInsets(top: 24, leading: 32, bottom: 24, trailing: 32))
    }
}

struct GameAROverlay_Previews: PreviewProvider {
    
    static let game = Game()
    
    static var previews: some View {
        game.state = .successPanel
        return GameAROverlay(game: game)
    }
}
