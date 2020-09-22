//
//  AudioPlayer.swift
//  NouvelleRealite
//
//  Created by Romain Penchenat on 21/09/2020.
//

import SwiftUI

struct AudioPlayer: View {
    
    @ObservedObject var game:Game
    
    var body: some View {
        GeometryReader { g in
            VStack {
                Spacer()
                VStack(alignment: .center, spacing: 16) {
                    Group {
                        Button(action: {
                            print("=> play/pause")
                        }, label: {
                            ZStack {
                                Circle()
                                    .frame(width: 56, height: 56)
                                    .foregroundColor(.nrBluePrimary)
                                Rectangle()
                                    .frame(width: 6, height: 24)
                                    .foregroundColor(.nrSun)
                                    .transformEffect(.init(translationX: -8, y: 0))
                                Rectangle()
                                    .frame(width: 6, height: 24)
                                    .foregroundColor(.nrSun)
                                    .transformEffect(.init(translationX: 8, y: 0))
                            }
                        })
                    }.transformEffect(.init(translationX: 0, y: -28))
                    ZStack(alignment: .leading) {
                        let barWidth = g.size.width - 32
                        Rectangle()
                            .frame(width: barWidth, height: 4)
                            .foregroundColor(.nrRiver)
                        Rectangle()
                            .frame(width: 0.5 * barWidth, height: 4)
                            .foregroundColor(.nrBluePrimary)
                        Circle()
                            .frame(width: 16, height: 16)
                            .foregroundColor(.nrBluePrimary)
                            .transformEffect(.init(translationX: (0.5 * barWidth) - 8, y: 0))
                        Text("01:12")
                            .modifier(BodyS())
                            .transformEffect(.init(translationX: 0.9 * barWidth, y: -12))
                    }
                        .padding(.bottom, 16)
                    Button("Prochaine mission", action: game.resetGame)
                        .buttonStyle(PrimaryButtonStyle())
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
                .background(Color.nrLightGrey)
            }
        }
    }
    
    
}

struct AudioPlayer_Previews: PreviewProvider {
    static var previews: some View {
        AudioPlayer(game: Game())
    }
}
