//
//  Game.swift
//  NouvelleRealite
//
//  Created by Romain Penchenat on 18/09/2020.
//

import Foundation
import AVFoundation
import SwiftUI

class Game: ObservableObject {
    
    enum State {
        case introductionTimer
        case introduction
        case playing
        case successFeedback
        case successPanel
        case successStory
    }
    
    enum Sound : String {
        case Success = "good"
        case Timer = "timer"
    }
    
    @Published var selectedChallenge:Challenge? = nil {
        didSet {
            gameDuration = 0
            timerValue = 3
            timer?.invalidate()
            if selectedChallenge != nil {
                play(sound: .Timer)
                timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: timerHandler)
            }
        }
    }
    @Published var state:Game.State = .introductionTimer
    var hasWin: Bool {  [.successFeedback, .successPanel, .successStory].contains{$0 == state} }
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
    private var audioPlayer:AVAudioPlayer?
    
    func playerDidWin() {
        self.state = .successFeedback
        play(sound: .Success)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation {
                self.state = .successPanel
            }
        }
    }
    
    private func timerHandler(_ timer:Timer) {
        guard state == .playing || state == .introduction || state == .introductionTimer else { return }
        if state == .introductionTimer {
            timerValue -= 1
            if timerValue == 0 {
                state = .introduction
                play(sound: .Success)
            } else {
                play(sound: .Timer)
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
        withAnimation {
            state = .introductionTimer
            selectedChallenge = nil
        }
    }
    
    func getMemoryHelp() {
        gameDuration += 10
        memoryHelpRemainingTime = 5
        memoryHelpIsDisplayed = true
    }
    
    private func play(sound: Sound) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: "mp3") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            audioPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            guard let player = audioPlayer else { return }
            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
        #if os(iOS)
        switch sound {
        case .Success:
            let generator = UIImpactFeedbackGenerator(style: .soft)
            generator.impactOccurred()
            break
        case .Timer:
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
            break
        }
        #endif
    }
    
}
