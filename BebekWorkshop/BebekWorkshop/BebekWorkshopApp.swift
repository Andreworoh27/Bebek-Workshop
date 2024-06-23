//
//  BebekWorkshopApp.swift
//  BebekWorkshop
//
//  Created by Andrew Oroh on 11/06/24.
//

import SwiftUI
import SwiftData

@main
struct BebekWorkshopApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            User.self,
            Book.self,
            ReadHistory.self,
            Book.self,
            Badge.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    @StateObject var userViewModel: UserViewModel = UserViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .font(Font.hostGrotesk(typography: .body))
                .modelContainer(sharedModelContainer)
        }
        .environmentObject(userViewModel)

    }
}
