//
//  ReadHistory.swift
//  BebekWorkshop
//
//  Created by Andrew Oroh on 11/06/24.
//

import Foundation
import SwiftData

@Model
class ReadHistory{
    var user: User?
    var book: Book?
    var minutesRead: Int
    var currentPage: Int
    var bookStatus: String
    var readDate: Date
    
    init(user: User? = nil, book: Book? = nil, minutesRead: Int, currentPage: Int, bookStatus: String, readDate: Date) {
        self.user = user
        self.book = book
        self.minutesRead = minutesRead
        self.currentPage = currentPage
        self.bookStatus = bookStatus
        self.readDate = readDate
    }
    
    static let sampleData = [
        ReadHistory(minutesRead: 4, currentPage: 4, bookStatus: "reading", readDate: Date()),
        ReadHistory(minutesRead: 5, currentPage: 7, bookStatus: "reading", readDate: ISO8601DateFormatter().date(from: "2024-06-18T00:00:00Z") ?? Date()),
        ReadHistory(minutesRead: 4, currentPage: 3, bookStatus: "reading", readDate: Date())
    ]
}

extension ReadHistory {
    static func accumulateReadingTimeLastWeek(readHistories: [ReadHistory]) -> [Date : Int] {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let oneWeekAgo = calendar.date(byAdding: .day, value: -7, to: today)!
        
        // Filter read histories for the last week
        let lastWeekReadHistories = readHistories.filter { $0.readDate >= oneWeekAgo }
        
        // Group by date and sum the minutesRead
        let groupedByDate = Dictionary(grouping: lastWeekReadHistories) { (readHistory) -> Date in
            calendar.startOfDay(for: readHistory.readDate)
        }
        
        let totalMinutesReadPerDay = groupedByDate.mapValues { readHistories in
            readHistories.reduce(0) { (currentSum, history) in currentSum + history.minutesRead }
        }
        
        // Ensure all days in the last week are included with at least 0 minutes
        var result: [Date: Int] = [:]
        for dayOffset in 0...6 {
            if let date = calendar.date(byAdding: .day, value: -dayOffset, to: today) {
                result[date] = totalMinutesReadPerDay[calendar.startOfDay(for: date)] ?? 0
            }
        }
        
        return result
    }
    
    static func accumulateReadingMinutesToday(readHistories: [ReadHistory]) -> Int {
        let currentDate = Calendar.current.startOfDay(for: Date())
        
        let todayReadHistories = readHistories.filter { Calendar.current.isDate($0.readDate, inSameDayAs: currentDate) }
        
        let totalMinutesToday = todayReadHistories.reduce(0) { (currentSum, history) in currentSum + history.minutesRead }
        
        return totalMinutesToday
    }
    
    static func checkProgress(user: User) -> Bool {
        print(user.histories.count)
        if (self.accumulateReadingMinutesToday(readHistories: user.histories) >= user.readingGoal) {
            return true
        } else {
            return false
        }
        
    }
    
    static func getCurrentReadingBooks(user: User) -> [Book] {
        let readingHistories = user.histories.filter { $0.bookStatus == "reading" }
        let readingBooks = readingHistories.compactMap { $0.book }
        
        // Use a dictionary to ensure each book is unique
        var uniqueBooksDict = [String: Book]()
        
        for book in readingBooks {
            uniqueBooksDict[book.identifier!] = book
        }
        
        return Array(uniqueBooksDict.values)
    }
}
