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
    private var user: User
    private var book: Book
    private var minutesRead: Int
    private var currentPage: Int
    private var bookStatus: String
    private var readDate: Date
    
    init(user: User, book: Book, minutesRead: Int, readDate: Date) {
        self.user = user
        self.book = book
        self.minutesRead = minutesRead
        self.readDate = readDate
    }
}
