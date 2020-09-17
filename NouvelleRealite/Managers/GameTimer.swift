//
//  GameTimer.swift
//  NouvelleRealite
//
//  Created by Romain Penchenat on 15/09/2020.
//

import Foundation

class GameTimer: ObservableObject {
    
    @Published var durationDisplay:String = "00:00"
    private var gameDuration = 0 {
        didSet {
            let seconds = gameDuration % 60
            let secondsDisplay = seconds < 10 ? "0\(seconds)" : "\(seconds)"
            let minutes = gameDuration / 60
            let minutesDisplay = minutes < 10 ? "0\(minutes)" : "\(minutes)"
            let display = "\(minutesDisplay):\(secondsDisplay)"
            DispatchQueue.main.async {
                self.durationDisplay = display
            }
        }
    }
    
    init() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: timerHandler)
    }
    
    private func timerHandler(_ timer:Timer) {
        gameDuration += 1
    }
    
    
}