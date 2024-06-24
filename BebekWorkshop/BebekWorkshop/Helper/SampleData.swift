//
//  SampleData.swift
//  BebekWorkshop
//
//  Created by Alfadli Maulana Siddik on 12/06/24.
//

import Foundation
import SwiftData

@MainActor
class SampleData {
    static let shared = SampleData()
    
    let modelContainer: ModelContainer
    
    var context: ModelContext {
        modelContainer.mainContext
    }
    
    private init() {
        let schema = Schema([
            Book.self,
            Review.self,
            User.self,
            ReadHistory.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        
        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            Task {
                try await insertSampleData()
            }
        } catch {
            fatalError("Error on SampleData: \(error)")
        }
    }
    
    func insertSampleData() async throws {
        let books: [Book] = await generateBook()

        for book in books {
            context.insert(book)
        }
        
        for user in User.sampleData {
            context.insert(user)
        }
        
        for history in ReadHistory.sampleData {
            context.insert(history)
        }
        
        for (_, history) in ReadHistory.sampleData.enumerated() {
            history.user = User.sampleData[0]
            history.book = books[0]
        }
        
        do {
            try context.save()
        } catch {
            print("Error when inserting sample data: \(error)")
        }
    }
}
