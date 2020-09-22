//
//  GameStandView.swift
//  NouvelleRealite
//
//  Created by Romain Penchenat on 15/09/2020.
//

import SwiftUI

struct GameStandView: View {
    
    @ObservedObject var game:Game
    @State private var isAnimated:Bool = false
    
    private let shapeAnim = Animation.easeInOut(duration: 5).repeatForever()
    
    var body: some View {
        GeometryReader(content: { g in
            let h = g.size.height
            let w = g.size.width
            ZStack {
                Rectangle()
                    .foregroundColor(.nrRiver)
                    .frame(width: 64, height: isAnimated ? h * 0.2 : h * 0.4)
                    .position(x: 32, y: isAnimated ? h * 0.4 : h * 0.5)
                    .animation(shapeAnim)
                Rectangle()
                    .foregroundColor(.nrBluePrimary)
                    .frame(width: isAnimated ? w * 0.3 : w * 0.6, height: 64)
                    .position(x: isAnimated ? w * 0.15 : w * 0.7, y: h * 0.8)
                    .animation(shapeAnim)
                Circle()
                    .foregroundColor(.nrRedPrimary)
                    .frame(width: 160, height: 160)
                    .position(x: w, y: isAnimated ? h * 0.7 : h * 0.3)
                    .animation(shapeAnim)
                Rectangle()
                    .foregroundColor(.nrSun)
                    .frame(width: isAnimated ? 160 : 120, height: isAnimated ? 160 : 120)
                    .rotationEffect(.degrees(isAnimated ? 175 : 0))
                    .position(x: w * 0.5, y: h * 0.4)
                    .animation(shapeAnim)
                VStack {
                    HelpBlock(type: .StandMode)
                    Spacer()
                    if game.memoryHelpIsDisplayed {
                        ModelViewer()
                    } else {
                        Text(game.durationDisplay)
                            .modifier(BigText())
                    }
                    Spacer()
                    if game.memoryHelpIsDisplayed {
                        Text("\(game.memoryHelpRemainingTime)s")
                            .modifier(BigText(color: .nrRedPrimary))
                        Text("Aide mémoire")
                            .modifier(BodyM())
                    } else {
                        Button("J'ai perdu la mémoire !", action: game.getMemoryHelp)
                            .buttonStyle(PrimaryButtonStyle(color: .nrRedPrimary))
                    }
                }.padding(EdgeInsets(top: 24, leading: 32, bottom: 24, trailing: 32))
            }
            .onAppear { isAnimated = true }
        })
    }
}

struct GameStandView_Previews: PreviewProvider {
    
    static var previews: some View {
        GameStandView(game: Game())
    }
    
}
