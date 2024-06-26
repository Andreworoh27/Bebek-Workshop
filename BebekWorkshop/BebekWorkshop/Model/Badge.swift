//
//  Badge.swift
//  BebekWorkshop
//
//  Created by Andrew Oroh on 11/06/24.
//

import Foundation
import SwiftData

@Model
class Badge{
    var image: String
    var imagePlaceholder: String
    var name: String
    var badgeDescription: String
    
    init(image: String, imagePlaceholder: String, name: String, badgeDescription: String) {
        self.image = image
        self.imagePlaceholder = imagePlaceholder
        self.name = name
        self.badgeDescription = badgeDescription
    }
    
    static let sampleData = [
        Badge(image: "reading-rookie", imagePlaceholder: "reading-rookie-placeholder", name: "Reading Rookie", badgeDescription: "First step to start your reading journey"),
        Badge(image: "story-seeker", imagePlaceholder: "story-seeker-placeholder", name: "Story Seeker", badgeDescription: "Picking your first book to read"),
    ]
}
