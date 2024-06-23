//
//  BookDataGenerator.swift
//  BebekWorkshop
//
//  Created by Andrew Oroh on 22/06/24.
//

import Foundation
import ReadiumShared

func generateBook() async -> [Book]{
    var bookUrls: [URL] = []
    bookUrls.append(Bundle.main.url(forResource: "How To Win Friends and Influence People", withExtension: "epub")!)
    bookUrls.append(Bundle.main.url(forResource: "Murder on the Orient Express", withExtension: "epub")!)
    
    var books : [Book] = []
    
    let bookSerivces = BookServices()
    
    do{
        
        for url in bookUrls {
            let book = try await bookSerivces.importPublication(from: url.absoluteURL!)
            books.append(book)
            
        }

    }catch{
        print("book import failed")
    }
    
    return books
}
