//
//  DetailView.swift
//  BebekWorkshop
//
//  Created by Alfadli Maulana Siddik on 13/06/24.
//

import SwiftUI

struct DetailView: View {
    
    var book: Book
    var body: some View {
        HStack {
            Image(book.image)
            VStack(alignment: .leading) {
                Text(book.title)
                Text(book.author)
                NavigationLink {
                    BookView(book: book)
                } label: {
                    Text("Read")
                        .foregroundStyle(.black)
                        .padding()
                        .background(.orange)
                        .clipShape(.buttonBorder)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        DetailView(book: Book.sampleData[0])
            
    }
    .environmentObject(UserViewModel())
}
