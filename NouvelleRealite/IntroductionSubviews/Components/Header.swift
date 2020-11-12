//
//  Header.swift
//  NouvelleRealite
//
//  Created by Romain Penchenat on 25/09/2020.
//

import SwiftUI

struct Header: View {
    
    var body: some View {
        HStack(alignment: .top, content: {
            Text("nouvelle\nréalité")
                .modifier(SubTitle(color: .nrSkin))
            Spacer()
        })
        .padding(32)
        .foregroundColor(Color.nrSkin)
        .background(Color.nrBluePrimary.edgesIgnoringSafeArea(.top))
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
