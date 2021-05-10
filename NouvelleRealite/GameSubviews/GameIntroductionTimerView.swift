//
//  GameIntroductionTimerView.swift
//  NouvelleRealite
//
//  Created by Romain Penchenat on 10/05/2021.
//

import SwiftUI

struct GameIntroductionTimerView: View {
    
    @ObservedObject var game:Game
    private var backgroundColor: Color {
        switch game.timerValue {
        case 3: return .nrSun
        case 2: return .nrBluePrimary
        case 1: return .nrRedPrimary
        default: return .nrSkin
        }
    }
    private var textColor: Color {
        switch game.timerValue {
        case 3: return .nrBluePrimary
        case 2: return .nrRedPrimary
        case 1: return .nrRiver
        default: return .nrSun
        }
    }
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text("\(game.timerValue)")
                    .modifier(TimerText(color: textColor))
                Spacer()
            }
            Spacer()
        }
        .background(backgroundColor)
        .edgesIgnoringSafeArea(.all)
    }
    
}

struct GameIntroductionTimerView_Previews: PreviewProvider {
    static var previews: some View {
        GameIntroductionTimerView(game: Game())
    }
}
