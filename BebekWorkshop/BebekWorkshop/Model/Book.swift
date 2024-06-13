//
//  Book.swift
//  BebekWorkshop
//
//  Created by Andrew Oroh on 11/06/24.
//

import Foundation
import SwiftData

@Model
class Book: Decodable {
    enum CodingKeys: CodingKey {
        case isbn, image, title, author, pages, desc, published, publisher, language, categories
    }
    
    var isbn: String
    var image: String
    var title: String
    var author: String
    var pages: Int
    var desc: String
    var published: Date
    var publisher: String
    var language: String
    var categories: [String]
    var review = [Review]()
    
    init(isbn: String, image: String, title: String, author: String, pages: Int, desc: String, published: Date, publisher: String, language: String, categories:[String]) {
        self.isbn = isbn
        self.image = image
        self.title = title
        self.author = author
        self.pages = pages
        self.desc = desc
        self.published = published
        self.publisher = publisher
        self.language = language
        self.categories = categories
    }
    
    required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            isbn = try container.decode(String.self, forKey: .isbn)
            image = try container.decode(String.self, forKey: .image)
            title = try container.decode(String.self, forKey: .title)
            author = try container.decode(String.self, forKey: .author)
        
            let pagesString = try container.decode(String.self, forKey: .pages)
            pages = Int(pagesString) ?? 0 // Convert string to Int
            desc = try container.decode(String.self, forKey: .desc)
        
            let publishedString = try container.decode(String.self, forKey: .published)
            let dateFormatter = ISO8601DateFormatter()
            published = dateFormatter.date(from: publishedString) ?? Date()
            publisher = try container.decode(String.self, forKey: .publisher)
            language = try container.decode(String.self, forKey: .language)
            categories = try container.decode([String].self, forKey: .categories)
        }
}
