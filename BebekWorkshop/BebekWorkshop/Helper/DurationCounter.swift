//
//  DurationCounter.swift
//  BebekWorkshop
//
//  Created by Alfadli Maulana Siddik on 13/06/24.
//

import Foundation

struct DurationCounter {
    var minutes: Int = 0
    var seconds: Int = 0
    
    var startTime: Date?

    var elapsedTime: String {
        guard startTime != nil else { return "00:00" }
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    mutating func update() {
        guard let startTime = startTime else { return }
        let duration = Date().timeIntervalSince(startTime)
        
        self.minutes = Int((duration.truncatingRemainder(dividingBy: 3600)) / 60)
        self.seconds = Int(duration.truncatingRemainder(dividingBy: 60))
    }
}
