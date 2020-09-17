//
//  PrimaryButton.swift
//  NouvelleRealite
//
//  Created by Romain Penchenat on 15/09/2020.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    
    var color:Color = .nrOceanBlack
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .modifier(SubTitle(color: color))
            .multilineTextAlignment(.center)
            .padding(EdgeInsets(top: 16, leading: 40, bottom: 16, trailing: 40))
            .border(color, width: 4)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 24) {
            Button("Primary button") {
                print("hey")
            }.buttonStyle(PrimaryButtonStyle())
            Button("Primary button") {
                print("hey")
            }.buttonStyle(PrimaryButtonStyle(color: .nrBluePrimary))
        }
    }
}
