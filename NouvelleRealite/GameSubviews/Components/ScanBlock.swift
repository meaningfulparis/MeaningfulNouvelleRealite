//
//  ScanBlock.swift
//  NouvelleRealite
//
//  Created by Romain Penchenat on 17/09/2020.
//

import SwiftUI

struct ScanBlock: View {
    
    @ObservedObject var game:Game
    
    var body: some View {
        GeometryReader(content: { geometry in
            let size = CGSize(width: geometry.size.width, height: 48)
            VStack {
                Spacer()
                ZStack {
                    NRRectangle(size: size, color: .nrRedPrimary, index: 2, game: game)
                    NRRectangle(size: size, color: .nrSun, index: 1, game: game)
                    NRRectangle(size: size, color: .nrBluePrimary, index: 0, game: game)
                    if game.hasWin {
                        Text("Bravo !")
                            .modifier(SubTitle(color: .nrSkin))
                    } else {
                        Text("Scan du tableau en cours...")
                            .modifier(SubTitle(color: .nrSkin))
                    }
                }
                .frame(width: size.width, height: size.height)
                .background(Color.nrBluePrimary)
                .clipped()
            }
        })
    }
}

struct NRRectangle : View {
    
    let size:CGSize
    let color:Color
    let index:CGFloat
    @ObservedObject var game:Game
    @State private var isAnimated:Bool = false
    
    var body: some View {
        Rectangle()
            .frame(width: game.hasWin ? 16 : size.width, height: size.height)
            .foregroundColor(color)
            .position(
                x: game.hasWin ? 8 + index * 16 : (isAnimated ? (index + 0.5) * size.width : (index - 2.5) * size.width),
                y: size.height / 2
            )
            .animation(game.hasWin ? .easeOut(duration: 2) : Animation.linear(duration: 10).repeatForever(autoreverses: false))
            .onAppear { isAnimated.toggle() }
    }
    
}

struct ScanBlock_Previews: PreviewProvider {
    static var previews: some View {
        ScanBlock(game: Game())
    }
}
