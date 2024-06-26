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
                .scaledToFit()
                .frame(height: 300)
                .cornerRadius(10)
                .overlay {
                    VStack {
                        Spacer()
                        HStack {
                            VStack (alignment: .leading, spacing: 4) {
                                Text(book.title)
                                    .font(Font.hostGrotesk(typography: .title3))
                                Text(book.authors ?? "-")
                                    .font(Font.hostGrotesk(typography: .caption2))
                            }
                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                            .padding()
                            .foregroundColor(.white)
                            Spacer()
                        }
                    }
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.primaryOreo.opacity(0.7), .clear]),
                            startPoint: .bottom,
                            endPoint: .top
                        )
                    )
                }
        } else {
            Image("book-cover-placeholder")
                .resizable()
                .scaledToFit()
                .frame(height: 207)
                .cornerRadius(10)
        }
    }
}

#Preview {
    CurrentlyReadBookCoverComponent(book: Book.sampleData[0])
}
