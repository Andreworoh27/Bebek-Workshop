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
    
    /// Last read location in the publication.
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
    
    static let sampleData = [
        Book(title: "test book", type: "epub", path: "dfsds"),
        Book(title: "test book2 ", type: "epub", path: "dfsds342432")
    ]
}
