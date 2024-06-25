//
//  ChartViewModel.swift
//  BebekWorkshop
//
//  Created by Safira Humaira on 25/06/24.
//

import Foundation
import Observation

@Observable
class ChartViewModel {
    var data: [AverageReadingTime] = [
        AverageReadingTime(day: "Mon", minutes: 20),
        AverageReadingTime(day: "Tue", minutes: 10),
        AverageReadingTime(day: "Wed", minutes: 15),
        AverageReadingTime(day: "Thu", minutes: 10),
        AverageReadingTime(day: "Fri", minutes: 20),
        AverageReadingTime(day: "Sat", minutes: 5),
        AverageReadingTime(day: "Sun", minutes: 10),
    ]
}
