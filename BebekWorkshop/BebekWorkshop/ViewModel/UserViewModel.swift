//
//  UserViewModel.swift
//  BebekWorkshop
//
//  Created by Alfadli Maulana Siddik on 13/06/24.
//

import Foundation
import SwiftData

class UserViewModel: ObservableObject {
    @Published var currentLogUser : User?
    @Published var showAlert: Bool
    @Published var showProfile: Bool
    @Published var alertHasShown: Bool
    
    var userHistories: [ReadHistory] {
        currentLogUser?.histories ?? []
    }
    
    var userBadges: [Badge] {
        currentLogUser?.badges ?? []
    }
    
    var userReadingGoal: Int {
        currentLogUser?.readingGoal ?? 0
    }
    
    init() {
        self.showAlert = false
        self.alertHasShown = false
        self.showProfile = false
    }
    
    func setCurrentLogUser(user: User){
        currentLogUser = user
    }
    
    func insertNewUser(newUser: User, context : ModelContext){
        context.insert(newUser)
    }
}
