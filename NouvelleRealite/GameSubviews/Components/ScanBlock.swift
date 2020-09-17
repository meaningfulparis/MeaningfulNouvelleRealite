//
//  ScanBlock.swift
//  NouvelleRealite
//
//  Created by Romain Penchenat on 17/09/2020.
//

import SwiftUI

struct ScanBlock: View {
    
    @State var objectHasBeenDetected:Bool = false
    
    var body: some View {
        GeometryReader(content: { geometry in
            let size = CGSize(width: geometry.size.width, height: 48)
            VStack {
                Spacer()
                ZStack {
                    NRRectangle(size: size, color: .nrRedPrimary, index: 2)
                    NRRectangle(size: size, color: .nrSun, index: 1)
                    NRRectangle(size: size, color: .nrBluePrimary, index: 0)
                    if objectHasBeenDetected {
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
    @State private var isAnimated:Bool = false
    
    private let anim = Animation.linear(duration: 10).repeatForever(autoreverses: false)
    
    var body: some View {
        Rectangle()
            .frame(width: size.width, height: size.height)
            .foregroundColor(color)
            .position(
                x: isAnimated ? (index + 0.5) * size.width : (index - 2.5) * size.width,
                y: size.height / 2
            )
            .animation(anim)
            .onAppear { isAnimated.toggle() }
    }
    
}

struct ScanBlock_Previews: PreviewProvider {
    static var previews: some View {
        ScanBlock()
    }
}
