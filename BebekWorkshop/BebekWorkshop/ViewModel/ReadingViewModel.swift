//
//  ReadingViewModel.swift
//  BebekWorkshop
//
//  Created by Alfadli Maulana Siddik on 13/06/24.
//

import Foundation

class ReadingViewModel: ObservableObject {
    @Published var isReading: Bool = false
    @Published var durationCounter: DurationCounter = DurationCounter()
    private var timer: Timer?
    
    func toggleTracking() {
        if isReading {
            stopTracking()
        } else {
            startTracking()
        }
    }
    
    private func startTracking() {
        isReading = true
        startTimer()
    }
    
    private func stopTracking() {
        isReading = false
        stopTimer()
    }
    
    private func startTimer() {
        durationCounter.startTime = Date()
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.durationCounter.update()
        }
    }
    
    private func stopTimer() {
        self.timer?.invalidate()
        self.timer = nil
        durationCounter.startTime = nil
    }
}
