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
            User.self,
            ReadHistory.self,
            Badge.self,
            Challenge.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        
        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
//            insertSampleData()
        } catch {
            fatalError("Error on SampleData: \(error)")
        }
    }
    
    func insertSampleData() {
        for badge in Badge.sampleData {
            context.insert(badge)
        }
        
        do {
            try context.save()
        } catch {
            print("Error when inserting sample data: \(error)")
        }
    }
}
