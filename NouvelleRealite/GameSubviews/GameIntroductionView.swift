//
//  GameIntroductionView.swift
//  NouvelleRealite
//
//  Created by Romain Penchenat on 15/09/2020.
//

import SwiftUI

struct GameIntroductionView: View {
    
    let startAction:() -> Void
    
    var body: some View {
        VStack(alignment: .center, spacing: 24) {
            VStack(alignment: .leading, spacing: 24) {
                Text("Mémorisez le tableau")
                    .modifier(Title(color: .nrRedPrimary))
                Text("Puis construisez grâce à votre mémoire")
                    .modifier(Title(color: .nrBluePrimary))
            }
            Spacer()
            Image("Preview")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(minWidth: 300, idealWidth: UIScreen.main.bounds.width, maxWidth: UIScreen.main.bounds.width, minHeight: 0, idealHeight: 300, maxHeight: 500, alignment: .center)
            Spacer()
            Button("3, 2, 1, C'est parti !", action: startAction).buttonStyle(PrimaryButtonStyle())
        }.padding(EdgeInsets(top: 24, leading: 32, bottom: 24, trailing: 32))
    }
}

struct GameIntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        GameIntroductionView(startAction: {
            print("gooooo")
        })
    }
}
