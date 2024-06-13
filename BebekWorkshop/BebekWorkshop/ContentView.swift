//
//  ContentView.swift
//  BebekWorkshop
//
//  Created by Andrew Oroh on 11/06/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var books: [Book]
    @Environment(\.modelContext) private var context
    
    var body: some View {
        NavigationStack {
            List (books) { book in
                NavigationLink {
                    Text(book.title)
                } label: {
                    Text(book.isbn)
                }
            }
            .navigationTitle("Todos")
        }
    }
}

#Preview {
    ContentView().modelContainer(SampleData.shared.modelContainer)
}
