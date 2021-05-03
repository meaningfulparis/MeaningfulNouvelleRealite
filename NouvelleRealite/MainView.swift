//
//  MainView.swift
//  NouvelleRealite
//
//  Created by Romain Penchenat on 25/09/2020.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var game = Game()
    
    var body: some View {
        ZStack {
            Color.nrSkin.edgesIgnoringSafeArea(.all)
            if game.selectedChallenge != nil {
                GameView(game: game)
            } else {
                IntroductionView(game: game)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewDevice("iPhone 12")
    }
}
