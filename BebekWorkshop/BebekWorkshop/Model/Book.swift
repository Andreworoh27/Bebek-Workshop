//
//  Book.swift
//  BebekWorkshop
//
//  Created by Andrew Oroh on 11/06/24.
//

import Foundation
import SwiftData

@Model
class Book{
    private var isbn: String
    private var title: String
    private var author: String
    private var pages: Int
    private var descriptiion: String
    private var published: Date
    private var publisher: String
    private var language: String
    private var review: [Review]
    
    init(isbn: String, title: String, author: String, pages: Int, descriptiion: String, published: Date, publisher: String, language: String, review: [Review]) {
        self.isbn = isbn
        self.title = title
        self.author = author
        self.pages = pages
        self.descriptiion = descriptiion
        self.published = published
        self.publisher = publisher
        self.language = language
        self.review = review
    }
}
