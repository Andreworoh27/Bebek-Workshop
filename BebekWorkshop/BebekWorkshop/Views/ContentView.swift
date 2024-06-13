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
            VStack(alignment: .leading) {
                Text("Self Help")
                    .font(.headline)
                    .padding(.leading, 15)
                    .padding(.top, 5)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(books) { book in
                            if (book.categories.contains("Self-help")) {
                                NavigationLink {
                                    DetailView(book: book)
                                } label: {
                                    CategoryItem(book: book)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct CategoryItem: View {
    var book: Book
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(book.image)
                .resizable()
                .frame(height: 205)
                .cornerRadius(5)
            Text(book.title)
                .font(.caption)
        }
        .padding(.leading, 15)
        .frame(width: 155)
    }
}

#Preview {
    ContentView().modelContainer(SampleData.shared.modelContainer)
}
