//
//  GameView.swift
//  NouvelleRealite
//
//  Created by Romain Penchenat on 15/09/2020.
//

import SwiftUI

struct GameView: View {
    
    @State var isPlaying:Bool = false
    @ObservedObject var standModeDetector = StandModeDetector()
    
    var body: some View {
        HStack(alignment: .top, spacing: 24){
            VStack {
                GameHeader(title: "Composition II", timing: "00:00")
                ZStack {
                    if isPlaying {
                        GeometryReader { geometry in
                            GameARView()
                                .padding(EdgeInsets(top: -24, leading: 0, bottom: -geometry.safeAreaInsets.bottom, trailing: 0))
                        }
                        if standModeDetector.isInStandMode {
                            GameStandView()
                        }
                    } else {
                        GameIntroductionView(startAction: {
                            print("-> is playing")
                            isPlaying = true
                        })
                    }
                }
                Spacer()
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
