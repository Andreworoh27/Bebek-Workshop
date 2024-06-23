//
//  Book.swift
//  BebekWorkshop
//
//  Created by Andrew Oroh on 11/06/24.
//

import Foundation
import SwiftData
import ReadiumShared

@Model
class Book {
    var identifier: String?
    /// Title of the publication, extracted from its metadata.
    var title: String
    /// Authors of the publication, separated by commas.
    var authors: String?
    /// Media type associated to the publication.
    var type: String
    /// Location of the packaged publication or a manifest.
    var path: String
    /// Location of the cover.
    var coverPath: String?
    
//    /// Last read location in the publication.
//    var locator: Locator? {
//        didSet { progression = locator?.locations.totalProgression ?? 0 }
//    }

//    /// Current progression in the publication, extracted from the locator.
//    var progression: Double
    /// Date of creation.
    var created: Date
    /// JSON of user preferences specific to this publication (e.g. language,
    /// reading progression, spreads).
    var preferencesJSON: String?
    
    init(
        identifier: String? = nil,
        title: String,
        authors: String? = nil,
        type: String,
        path: String,
        coverPath: String? = nil,
        locator: Locator? = nil,
        created: Date = Date(),
        preferencesJSON: String? = nil
    ) {
        self.identifier = identifier
        self.title = title
        self.authors = authors
        self.type = type
        self.path = path
        self.coverPath = coverPath
//        self.locator = locator
//        progression = locator?.locations.totalProgression ?? 0
        self.created = created
        self.preferencesJSON = preferencesJSON
    }
    
    var cover: FileURL? {
        coverPath.map { Paths.covers.appendingPath($0, isDirectory: false) }
    }
    
    
//    enum CodingKeys: CodingKey {
//        case isbn, image, title, author, pages, desc, published, publisher, language, categories
//    }
//    
//    var isbn: String
//    var image: String
//    var title: String
//    var author: String
//    var pages: Int
//    var desc: String
//    var published: Date
//    var publisher: String
//    var language: String
//    var categories: [String]
//    var review = [Review]()
//    
//    init(isbn: String, image: String, title: String, author: String, pages: Int, desc: String, published: Date, publisher: String, language: String, categories:[String]) {
//        self.isbn = isbn
//        self.image = image
//        self.title = title
//        self.author = author
//        self.pages = pages
//        self.desc = desc
//        self.published = published
//        self.publisher = publisher
//        self.language = language
//        self.categories = categories
//    }
//    
//    required init(from decoder: Decoder) throws {
//            let container = try decoder.container(keyedBy: CodingKeys.self)
//            isbn = try container.decode(String.self, forKey: .isbn)
//            image = try container.decode(String.self, forKey: .image)
//            title = try container.decode(String.self, forKey: .title)
//            author = try container.decode(String.self, forKey: .author)
//        
//            let pagesString = try container.decode(String.self, forKey: .pages)
//            pages = Int(pagesString) ?? 0 // Convert string to Int
//            desc = try container.decode(String.self, forKey: .desc)
//        
//            let publishedString = try container.decode(String.self, forKey: .published)
//            let dateFormatter = ISO8601DateFormatter()
//            published = dateFormatter.date(from: publishedString) ?? Date()
//            publisher = try container.decode(String.self, forKey: .publisher)
//            language = try container.decode(String.self, forKey: .language)
//            categories = try container.decode([String].self, forKey: .categories)
//        }
//    
    static let sampleData = [
        Book(title: "test book", type: "epub", path: "dfsds")
    ]
}
