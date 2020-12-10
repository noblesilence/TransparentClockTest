//
//  PPTMacTimer.swift
//  PPT Mac Timer
//
//  Created by Aye Aye Mon on 11/16/20.
//  Copyright © 2020 LTC Clock. All rights reserved.
//

import Foundation

protocol MyTimerProtocol {
    func timeRemainingOnTimer(_ timer: MyTimer, timeRemaining: TimeInterval)
    func timerHasFinished(_ timer: MyTimer)
}

class MyTimer : NSObject {
    var timer: Timer? = nil
    var startTime: Date?
    var duration: TimeInterval = 60 // default = 1 minute
    var elapsedTime: TimeInterval = 0
    var delegate: MyTimerProtocol?
    
    @objc dynamic func timerAction() {
        guard let startTime = startTime else {
            return
        }
        
        elapsedTime = -startTime.timeIntervalSinceNow
        
        let secondsRemaining = (duration - elapsedTime).rounded()
        delegate?.timeRemainingOnTimer(self, timeRemaining: secondsRemaining)
    }
    
    func startTimer() {
        startTime = Date()
        elapsedTime = 0
        
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(timerAction),
                                     userInfo: nil,
                                     repeats: true)
        timerAction()
    }
    
    func resumeTimer() {
        startTime = Date(timeIntervalSinceNow: -elapsedTime)
        
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(timerAction),
                                     userInfo: nil,
                                     repeats: true)
        timerAction()
    }
    
    func pauseTimer() {
        timer?.invalidate()
        timer = nil
        
        timerAction()
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
        
        timerAction()
    }
    
    func resetTimer() {
        stopTimer()
    }
}
