////
////  SampleData.swift
////  BebekWorkshop
////
////  Created by Alfadli Maulana Siddik on 12/06/24.
////
//
//import Foundation
//import SwiftData
//
//@MainActor
//class SampleData {
//    static let shared = SampleData()
//    
//    let modelContainer: ModelContainer
//    
//    var context: ModelContext {
//        modelContainer.mainContext
//    }
//    
//    private init() {
//        let schema = Schema([
//            Book.self,
//            Review.self,
//            User.self,
//            ReadHistory.self
//        ])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
//        
//        do {
//            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
//            insertSampleData()
//        } catch {
//            fatalError("Error on SampleData: \(error)")
//        }
//    }
//    
//    func insertSampleData() {
//        let books: [Book] = self.load("book.json")
//        for book in books {
//            context.insert(book)
//        }
//        
//        for user in User.sampleData {
//            context.insert(user)
//        }
//        
//        for review in Review.sampleData {
//            context.insert(review)
//        }
//        
//        for (index, review) in Review.sampleData.enumerated() {
//            review.user = User.sampleData[index]
//        }
//        
//        for book in books {
//            book.review.append(Review.sampleData[0])
//            book.review.append(Review.sampleData[1])
//            book.review.append(Review.sampleData[2])
//        }
//        
//        for history in ReadHistory.sampleData {
//            context.insert(history)
//        }
//        
//        for (index, history) in ReadHistory.sampleData.enumerated() {
//            history.user = User.sampleData[0]
//            history.book = books[index]
//        }
//        
//        do {
//            try context.save()
//        } catch {
//            print("Error when inserting sample data: \(error)")
//        }
//    }
//    
//    func load<T: Decodable>(_ filename: String) -> T {
//        let data: Data
//
//
//        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
//        else {
//            fatalError("Couldn't find \(filename) in main bundle.")
//        }
//
//
//        do {
//            data = try Data(contentsOf: file)
//        } catch {
//            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
//        }
//
//
//        do {
//            let decoder = JSONDecoder()
//            return try decoder.decode(T.self, from: data)
//        } catch {
//            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
//        }
//    }
//}
