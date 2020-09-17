//
//  HelpBlock.swift
//  NouvelleRealite
//
//  Created by Romain Penchenat on 15/09/2020.
//

import SwiftUI

struct HelpBlock: View {
    
    enum InfoType : String {
        case StandMode = "Attrapez votre téléphone pour scanner votre réalisation et accéder à la récompense en AR !"
        case ARMode = "Posez votre téléphone sur un support ou sur la table pour passer en mode socle"
    }
    
    let type:InfoType
    
    var body: some View {
        HStack(spacing: 16) {
            Group {
                Rectangle()
                    .frame(width: 48, height: 48)
                    .foregroundColor(Color.nrSun)
            }
            Text(type.rawValue).modifier(BodyS())
        }
        .padding(16)
        .background(Color.nrRiver)
    }
}

struct HelpBlock_Previews: PreviewProvider {
    static var previews: some View {
        HelpBlock(type: .StandMode)
    }
}
