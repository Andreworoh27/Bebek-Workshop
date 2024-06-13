//
//  TimerManager.swift
//  BebekWorkshop
//
//  Created by Alfadli Maulana Siddik on 13/06/24.
//

//
//  TimerManager.swift
//  SelfTalk Watch App
//
//  Created by Alfadli Maulana Siddik on 19/05/24.
//

import Foundation
import Combine

class TimerManager: ObservableObject {
    @Published var durationCounter = DurationCounter()
    
    private var timer: Timer?
    
    func startTimer() {
        durationCounter.startTime = Date()
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.durationCounter.update()
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
        durationCounter.startTime = nil
    }
}

