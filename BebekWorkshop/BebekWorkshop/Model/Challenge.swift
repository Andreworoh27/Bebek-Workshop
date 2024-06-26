//
//  Challenge.swift
//  BebekWorkshop
//
//  Created by Andrew Oroh on 25/06/24.
//

import Foundation
import SwiftData

@Model
class Challenge{
    var challengeTitle: String
    var challengeDescription : String
    var challengeStartDate : Date?
    var challengeEndDate : Date?
    var challengeCurrentDateCounter: Int
    var challengeDayDuration : Int

    init(challengeTitle: String, challengeDescription: String, challengeDayDuration: Int) {
        self.challengeTitle = challengeTitle
        self.challengeDescription = challengeDescription
        self.challengeCurrentDateCounter = 0
        self.challengeDayDuration = challengeDayDuration
        self.challengeStartDate = nil
        self.challengeEndDate = nil
    }
    
}
