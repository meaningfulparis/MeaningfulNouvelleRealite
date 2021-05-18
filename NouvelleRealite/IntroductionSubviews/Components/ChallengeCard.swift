//
//  ChallengeCard.swift
//  NouvelleRealite
//
//  Created by Romain Penchenat on 25/09/2020.
//

import SwiftUI

struct ChallengeCard: View {
    
    var challenge:Challenge
    var tapHandler:(Challenge) -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .frame(width: 6, height: 40)
                .foregroundColor(.nrLightGrey)
            HStack(spacing: 0) {
                VStack(alignment: .leading) {
                    Text(challenge.type.rawValue).modifier(BodyS())
                    Text(challenge.name).modifier(SubTitle())
                }
                .padding(.all, 32)
                Spacer()
                Rectangle()
                    .frame(width: 5)
                    .foregroundColor(challenge.color)
                    .padding(.all, 0)
                Image("ArrowIcon")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .foregroundColor(challenge.color)
                    .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
            }
                .border(challenge.color, width: 5)
                .padding(EdgeInsets(top: 0, leading: 32, bottom: 0, trailing: 32))
                .onTapGesture { tapHandler(challenge) }
        }
    }
}

struct ChallengeCard_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeCard(challenge: Challenge(type: .creation, name: "Reproduction II", artist: "Piet Mondrian", color: .nrSun, previewFileName: "composition.usdz", sceneAR: try! CompositionMondrian.loadBox()), tapHandler: { challenge in print(challenge) })
    }
}
