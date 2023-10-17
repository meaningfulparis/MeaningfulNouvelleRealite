//
//  HelpBlock.swift
//  NouvelleRealite
//
//  Created by Romain Penchenat on 15/09/2020.
//

import SwiftUI

struct HelpBlock: View {
    
    enum InfoType : String {
        #if os(visionOS)
        case StandMode = "Recréez le tableau de mémoire avec vos legos afin de débloquer une récompense secrète !"
        #else
        case StandMode = "Attrapez votre téléphone pour scanner votre réalisation et accéder à la récompense en AR !"
        #endif
        case ARMode = "Posez votre téléphone sur un support ou sur la table pour passer en mode socle"
    }
    
    let type:InfoType
    
    var body: some View {
        HStack(spacing: 16) {
            Group {
                Image(type == .StandMode ? "ScanIcon" : "StandIcon")
                    .frame(width: 48, height: 48)
            }
            Text(type.rawValue)
                .modifier(BodyS())
        }
        .padding(16)
        .background(Color.nrLightGrey)
    }
}

struct HelpBlock_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HelpBlock(type: .StandMode)
            HelpBlock(type: .ARMode)
        }
    }
}
