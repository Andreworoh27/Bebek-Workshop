//
//  UserViewModel.swift
//  BebekWorkshop
//
//  Created by Alfadli Maulana Siddik on 13/06/24.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var showAlert: Bool
    @Published var alertHasShown: Bool
    
    init() {
        self.showAlert = false
        self.alertHasShown = false
    }
}
