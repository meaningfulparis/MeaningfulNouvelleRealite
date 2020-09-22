//
//  IntExtension.swift
//  NouvelleRealite
//
//  Created by Romain Penchenat on 22/09/2020.
//

import Foundation

extension Int {
    
    func convertToTime() -> String {
        let seconds = self % 60
        let secondsDisplay = seconds < 10 ? "0\(seconds)" : "\(seconds)"
        let minutes = self / 60
        let minutesDisplay = minutes < 10 ? "0\(minutes)" : "\(minutes)"
        return "\(minutesDisplay):\(secondsDisplay)"
    }
    
}
