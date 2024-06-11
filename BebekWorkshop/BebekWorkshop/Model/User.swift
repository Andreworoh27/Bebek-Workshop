//
//  User.swift
//  BebekWorkshop
//
//  Created by Andrew Oroh on 11/06/24.
//

import Foundation
import SwiftData

@Model
class User {
    private var name: String
    private var username: String
    private var email: String
    private var password: String
    private var readingGoal: Int
    private var preferedGenres: [String]
    private var streak : Int
    private var books: [Book]
    
    init(name: String, username: String, email: String, password: String, readingGoal: Int, preferedGenres: [String], streak: Int, books: [Book]) {
        self.name = name
        self.username = username
        self.email = email
        self.password = password
        self.readingGoal = readingGoal
        self.preferedGenres = preferedGenres
        self.streak = streak
        self.books = books
    }

}
