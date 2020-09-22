//
//  TextModifiers.swift
//  NouvelleRealite
//
//  Created by Romain Penchenat on 17/09/2020.
//

import SwiftUI

struct BigText: ViewModifier {
    
    var color:Color = .nrOceanBlack
    
    func body(content: Content) -> some View {
        content
            .font(.custom("Sora-Bold", size: 80))
            .lineSpacing(8)
            .foregroundColor(color)
    }
    
}

struct LargeTitle: ViewModifier {
    
    var color:Color = .nrOceanBlack
    
    func body(content: Content) -> some View {
        content
            .font(.custom("Sora-Bold", size: 40))
            .lineSpacing(8)
            .foregroundColor(color)
            .textCase(.lowercase)
    }
    
}

struct Title: ViewModifier {
    
    var color:Color = .nrOceanBlack
    
    func body(content: Content) -> some View {
        content
            .font(.custom("Sora-Bold", size: 24))
            .lineSpacing(8)
            .foregroundColor(color)
    }
    
}

struct SubTitle: ViewModifier {
    
    var color:Color = .nrOceanBlack
    
    func body(content: Content) -> some View {
        content
            .font(.custom("Sora-Bold", size: 16))
            .lineSpacing(4)
            .foregroundColor(color)
    }
    
}

struct BodyM: ViewModifier {
    
    var color:Color = .nrOceanBlack
    
    func body(content: Content) -> some View {
        content
            .font(.custom("Sora-Regular", size: 16))
            .lineSpacing(6)
            .foregroundColor(color)
    }
    
}

struct BodyS: ViewModifier {
    
    var color:Color = .nrOceanBlack
    
    func body(content: Content) -> some View {
        content
            .font(.custom("Sora-Regular", size: 12))
            .lineSpacing(4)
            .foregroundColor(color)
    }
    
}

struct TextModifiers_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("01:54").modifier(BigText())
            Text("Nouvelle\nRéalité").modifier(LargeTitle())
            Text("Title sur 2 lignes voir plus et bien le voila le résultat").modifier(Title())
            Text("SubTitle sur 2 lignes voir plus et bien le voila le résultat").modifier(SubTitle())
            Text("Body sur 2 lignes voir plus et bien le voila le résultat").modifier(BodyM())
            Text("BodySmall sur 2 lignes voir plus et bien le voila le résultat, on écrit encore un peu allez").modifier(BodyS())
        }
        .padding()
    }
}
