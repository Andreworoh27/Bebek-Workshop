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
    var name: String
    var username: String
    var email: String
    var password: String
    var readingGoal: Int
    var preferedGenres: [String]
    var streak : Int
    var badges = [Badge]()
    var histories = [ReadHistory]()
    
    init(name: String, username: String, email: String, password: String, readingGoal: Int, preferedGenres: [String], streak: Int) {
        self.name = name
        self.username = username
        self.email = email
        self.password = password
        self.readingGoal = readingGoal
        self.preferedGenres = preferedGenres
        self.streak = streak
    }
    
    static let sampleData: [User] = [
        User(name: "User 1", username: "user1", email: "user1@gmail.com", password: "123456", readingGoal: 10, preferedGenres: ["Self-help"], streak: 0),
        User(name: "User 2", username: "user2", email: "user2@gmail.com", password: "123456", readingGoal: 5, preferedGenres: ["Self-help"], streak: 0),
        User(name: "User 3", username: "user3", email: "user3@gmail.com", password: "123456", readingGoal: 8, preferedGenres: ["Self-help"], streak: 0)
    ]
}
