//
//  BookViewModel.swift
//  BebekWorkshop
//
//  Created by Andrew Oroh on 22/06/24.
//

import Foundation
import SwiftData

class BookViewModel:ObservableObject{
    
//    private var context: ModelContext
    
    init(){
//        bookModelContainer = {
//            let schema = Schema([
//                Book.self
//            ])
//            let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//
//            do {
//                return try ModelContainer(for: schema, configurations: [modelConfiguration])
//            } catch {
//                fatalError("Could not create ModelContainer: \(error)")
//            }
//        }()
    }
    
    func addBook(newBook : Book, context : ModelContext){
        context.insert(newBook)
        print("Trigger")
    }
    
//    func generateInitialBookData(context : ModelContext) async {
//        var books = await generateBook()
//    }
}

