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
        ReadHistory(minutesRead: 10, currentPage: 4, bookStatus: "reading", readDate: Date()),
        ReadHistory(minutesRead: 5, currentPage: 7, bookStatus: "reading", readDate: Date()),
        ReadHistory(minutesRead: 8, currentPage: 3, bookStatus: "reading", readDate: Date())
    ]
}
