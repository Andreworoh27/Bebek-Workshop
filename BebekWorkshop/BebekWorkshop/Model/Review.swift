//
//  Review.swift
//  BebekWorkshop
//
//  Created by Andrew Oroh on 11/06/24.
//

import Foundation
import SwiftData

@Model
class Review{
    private var user: User
    private var book: Book
    private var reviewText: String
    private var rating: Float
    
    init(user: User, book: Book, reviewText: String, rating: Float) {
        self.user = user
        self.book = book
        self.reviewText = reviewText
        self.rating = rating
    }
}
