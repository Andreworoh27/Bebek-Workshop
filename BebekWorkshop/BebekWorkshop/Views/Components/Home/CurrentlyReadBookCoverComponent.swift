//
//  CurrentlyReadBookCoverComponent.swift
//  BebekWorkshop
//
//  Created by Andrew Oroh on 20/06/24.
//

import SwiftUI

struct CurrentlyReadBookCoverComponent: View {
    var book: Book
    var body: some View {
        if let coverUrl = book.cover?.url,
           let imageData = try? Data(contentsOf: coverUrl),
           let uiImage = UIImage(data: imageData) {
            Image(uiImage: uiImage)
                .resizable()
                .frame(width: 128,height: 207)
                .cornerRadius(10)
        } else {
            Image("book-cover-placeholder")
                .resizable()
                .frame(width: 128,height: 207)
                .cornerRadius(10)
        }
    }
}

#Preview {
    CurrentlyReadBookCoverComponent(book: Book.sampleData[0])
}
