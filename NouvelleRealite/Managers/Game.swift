//
//  Game.swift
//  NouvelleRealite
//
//  Created by Romain Penchenat on 18/09/2020.
//

import Foundation

class Game: ObservableObject {
    
    enum State {
        case introductionTimer
        case introduction
        case playing
        case successFeedback
        case successAudioPlaying
    }
    
    @Published var selectedChallenge:Challenge? = nil {
        didSet {
            gameDuration = 0
            timerValue = 3
            launchTimer()
        }
    }
    @Published var state:Game.State = .introductionTimer
    var hasWin: Bool { state == .successFeedback || state == .successAudioPlaying }
    @Published var memoryHelpIsDisplayed:Bool = true
    
    @Published var durationDisplay:String = "00:00"
    @Published var memoryHelpRemainingTime = 0
    @Published var timerValue = 3
    
    private var timer:Timer? = nil
    private var gameDuration = 0 {
        didSet {
            let display = gameDuration.convertToTime()
            DispatchQueue.main.async {
                self.durationDisplay = display
            }
        }
    }
    
    func launchTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: timerHandler)
    }
    
    private func timerHandler(_ timer:Timer) {
        guard state == .playing || state == .introduction || state == .introductionTimer else { return }
        if state == .introductionTimer {
            timerValue -= 1
            if timerValue == 0 {
                state = .introduction
            }
        } else {
            gameDuration += 1
            if memoryHelpIsDisplayed {
                if memoryHelpRemainingTime <= 0 {
                    memoryHelpIsDisplayed = false
                }
                memoryHelpRemainingTime -= 1
            }
        }
    }
    
    func resetGame() {
        state = .introductionTimer
        gameDuration = 0
    }
    
    func getMemoryHelp() {
        gameDuration += 10
        memoryHelpRemainingTime = 5
        memoryHelpIsDisplayed = true
    }
    
}
