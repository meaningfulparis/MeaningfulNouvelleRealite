//
//  SuccessPanel.swift
//  NouvelleRealite
//
//  Created by Romain Penchenat on 18/05/2021.
//

import SwiftUI

struct SuccessPanel: View {
    
    @ObservedObject var game:Game
    
    var body: some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading,spacing: 4) {
                    Text("bravo !").modifier(LargeTitle())
                    Text("Tu as débloqué l'oeuvre “\(game.selectedChallenge?.name ?? "objet inconnu")” de \(game.selectedChallenge?.artist ?? "inconnu") ...").modifier(SubTitle())
                }
                Button("Découvrir ma récompense", action: nextAction)
                    .buttonStyle(PrimaryButtonStyle())
            }
            Spacer()
        }
        .padding(16)
        .background(Color.nrLightGrey)
    }
    
    private func nextAction() {
        withAnimation {
            game.state = .successStory
        }
    }
    
}

struct SuccessPanel_Previews: PreviewProvider {
    
    static let game = Game()
    
    static var previews: some View {
        SuccessPanel(game: game)
    }
}
