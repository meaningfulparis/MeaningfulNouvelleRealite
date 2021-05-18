//
//  SuccessOverlay.swift
//  NouvelleRealite
//
//  Created by Romain Penchenat on 17/05/2021.
//

import SwiftUI

struct SuccessOverlay: View {
    
    @ObservedObject var game:Game
    
    private let colors:[Color] = [.nrSun, .nrRiver, .nrRedPrimary, .nrBluePrimary]
    private let elements = 64
    private let base:CGFloat = 48
    private let shapeAnim = Animation.easeOut(duration: 0.6)
    
    var body: some View {
        GeometryReader { geometry in
            let h = geometry.size.height
            let w = geometry.size.width
            ZStack {
                ForEach(0...elements, id: \.self) { index in
                    let width:CGFloat = base + CGFloat.random(in: 0...base)
                    let height:CGFloat = base + CGFloat.random(in: 0...base)
                    let y:CGFloat = h + height + CGFloat.random(in: 0...base * 4)
                    let x:CGFloat = w * CGFloat.random(in: 0...1)
                    let randomX:CGFloat = x + CGFloat.random(in: -16...16)
                    Rectangle()
                        .scaleEffect(game.hasWin ? 0.05 : 1)
                        .foregroundColor(colors[index % 4])
                        .cornerRadius(CGFloat.random(in: 0...base))
                        .rotationEffect(.init(degrees: Double.random(in: 0...360)))
                        .frame(width: width, height: height)
                        .position(x: game.hasWin ? randomX : x, y: game.hasWin ? -height/2 : y)
                        .animation(shapeAnim)
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
        .edgesIgnoringSafeArea(.all)
        .clipped()
    }
}

struct SuccessOverlay_Previews: PreviewProvider {
    
    static let game = Game()
    
    static var previews: some View {
        SuccessOverlay(game: game)
            .background(Color.nrSkin)
            .onTapGesture {
                game.state = game.hasWin ? .introduction : .successFeedback
            }
    }
}
