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
    private var image: String
    private var name: String
    private var badgeDescription: String
    
    init(image: String, name: String, badgeDescription: String) {
        self.image = image
        self.name = name
        self.badgeDescription = badgeDescription
    }
}
