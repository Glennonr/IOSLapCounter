//
//  StopWatch.swift
//  LapCounter
//
//  Created by Richie Glennon on 6/22/22.
//

import Combine
import Foundation
import SwiftUI

class StopWatch: ObservableObject {
    @Published var stopWatchTime = "00:00:00"
    @Published var paused = true
    private var sourceTimer: DispatchSourceTimer?
    private let queue = DispatchQueue(label: "stopwatch.timer")
    private var counter: Int = 0
    
    func start() {
        self.paused = !self.paused
        
        guard let _ = self.sourceTimer else {
            self.startTimer()
            return
        }
        
        self.resumeTimer()
    }
    
    func pause() {
        self.paused = !self.paused
        self.sourceTimer?.suspend()
    }
    
    func pass() {}
    
    func reset() {
        self.stopWatchTime = "00:00:00"
        self.counter = 0
    }
    
    func isPaused() -> Bool { return self.paused }
    
    private func startTimer() {
        self.sourceTimer = DispatchSource.makeTimerSource(flags: DispatchSource.TimerFlags.strict, queue: self.queue)
        self.resumeTimer()
    }
    
    private func resumeTimer() {
        self.sourceTimer?.setEventHandler {
            self.updateTimer()
        }
        self.sourceTimer?.schedule(deadline: .now(), repeating: 0.01)
        self.sourceTimer?.resume()
    }
    
    private func updateTimer() {
        self.counter += 1
        DispatchQueue.main.async {
            self.stopWatchTime = StopWatch.convertCountToTimeString(counter: self.counter)
        }
    }
}

extension StopWatch {
    struct LapItem {
        let uuid = UUID()
        let count: Int
        let stringTime: String
        
        init(count: Int, diff: Int = -1) {
            self.count = count
            
            if diff < 0 {
                self.stringTime = StopWatch.convertCountToTimeString(counter: count)
            } else {
                self.stringTime = StopWatch.convertCountToTimeString(counter: diff)
            }
        }
    }
}

extension StopWatch {
    static func convertCountToTimeString(counter: Int) -> String {
        let millseconds = counter % 100
        let seconds = (counter / 100) % 60
        let minutes = ((counter / (100*60)) % 60)

        var millsecondsString = "\(millseconds)"
        var secondsString = "\(seconds)"
        var minutesString = "\(minutes)"
        
        if millseconds < 10 {
            millsecondsString = "0" + millsecondsString
        }
        
        if seconds < 10 {
            secondsString = "0" + secondsString
        }
        
        if minutes < 10 {
            minutesString = "0" + minutesString
        }
        
        return "\(minutesString):\(secondsString):\(millsecondsString)"
    }
}
