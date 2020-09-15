//
//  StandModeDetector.swift
//  NouvelleRealite
//
//  Created by Romain Penchenat on 15/09/2020.
//

import Foundation
import CoreMotion

class StandModeDetector: ObservableObject {
    
    @Published var isInStandMode:Bool = false
    private let motion = CMMotionManager()
    
    init() {
        if motion.isDeviceMotionAvailable {
            motion.deviceMotionUpdateInterval = 0.2
            motion.showsDeviceMovementDisplay = true
            motion.startDeviceMotionUpdates(to: OperationQueue(), withHandler: handleMotionTracking)
        }
    }
    
    private func handleMotionTracking(_ motion: CMDeviceMotion?, _ error:Error?) {
//        print("\n------------")
        guard let motion = motion else { return }
        let acceleration = motion.userAcceleration
        let totalAcceleration = abs(acceleration.x) + abs(acceleration.y) + abs(acceleration.y)
        let pitch = motion.attitude.pitch / Double.pi * 180
//        print(acceleration)
//        print("pitch = \(pitch) || totalAcceleration = \(totalAcceleration)")
        if isInStandMode {
            // Check if is now moving
            if pitch > 2, pitch < 88, totalAcceleration > 0.05 {
//                print("-> 1. false")
                DispatchQueue.main.async { self.isInStandMode = false }
            } else if pitch > 92, totalAcceleration > 0.03 {
//                print("-> 2. false")
                DispatchQueue.main.async { self.isInStandMode = false }
            }
        } else {
            // Check if is now standing
            if pitch > -3, pitch < 3, totalAcceleration < 0.006 {
//                print("-> 1. true")
                DispatchQueue.main.async { self.isInStandMode = true }
            } else if pitch > 85, pitch < 95, totalAcceleration < 0.04 {
//                print("-> 2. true")
                DispatchQueue.main.async { self.isInStandMode = true }
            }
        }
    }
    
}
