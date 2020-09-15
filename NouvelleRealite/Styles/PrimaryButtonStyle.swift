//
//  PrimaryButton.swift
//  NouvelleRealite
//
//  Created by Romain Penchenat on 15/09/2020.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.nrOceanBlack)
            .font(.system(size: 30, weight: .bold, design: .default))
            .padding(EdgeInsets(top: 16, leading: 40, bottom: 16, trailing: 40))
            .border(Color.nrOceanBlack, width: 4)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        Button("Primary button") {
            print("hey")
        }.buttonStyle(PrimaryButtonStyle())
    }
}
