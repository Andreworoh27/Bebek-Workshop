//
//  UserViewModel.swift
//  BebekWorkshop
//
//  Created by Alfadli Maulana Siddik on 13/06/24.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var currentUser: User
    
    init() {
        self.currentUser = User(name: "User 1", username: "user1", email: "user1@gmail.com", password: "123456", readingGoal: 10, preferedGenres: ["Self-help"], streak: 0)
    }
}
