//
//  WeeklyChart.swift
//  BebekWorkshop
//
//  Created by Safira Humaira on 25/06/24.
//

import Foundation

struct AverageReadingTime: Identifiable {
    var id = UUID()
    
    var day: String
    var minutes: Double
}
