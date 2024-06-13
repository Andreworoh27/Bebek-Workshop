//
//  Review.swift
//  BebekWorkshop
//
//  Created by Andrew Oroh on 11/06/24.
//

import Foundation
import SwiftData

@Model
class Review {
    var user: User?
    var book: Book?
    var reviewText: String
    var rating: Float
    
    init(reviewText: String, rating: Float) {
        self.reviewText = reviewText
        self.rating = rating
    }
    
    static let sampleData = [
        Review(reviewText: "Bukunya bagus", rating: 4),
        Review(reviewText: "Keren sekali", rating: 5),
        Review(reviewText: "Keren sekali", rating: 5)
    ]
}
