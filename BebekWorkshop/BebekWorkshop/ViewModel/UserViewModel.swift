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
    @Published var alertHasShown: Bool
    
    init() {
        self.showAlert = false
        self.alertHasShown = false
    }
    
    func setCurrentLogUser(user: User){
        currentLogUser = user
    }
    
    func insertNewUser(newUser: User, context : ModelContext){
        context.insert(newUser)
    }
}
