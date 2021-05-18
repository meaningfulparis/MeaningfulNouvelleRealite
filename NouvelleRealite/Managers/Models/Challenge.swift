//
//  Challenge.swift
//  NouvelleRealite
//
//  Created by Romain Penchenat on 25/09/2020.
//

import Foundation
import SwiftUI
import RealityKit

struct Challenge : Identifiable {
    
    enum ChallengeType :String {
        case reproduction = "Reproduction"
        case creation = "Création"
    }
    
    let id: UUID = UUID()
    let type:ChallengeType
    let name:String
    let artist:String
    let color:Color
    let previewFileName:String
    let sceneAR:RealityKit.Scene.AnchorCollection.Element
    
}
