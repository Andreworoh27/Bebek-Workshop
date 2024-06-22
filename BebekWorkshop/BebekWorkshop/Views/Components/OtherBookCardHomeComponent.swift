//
//  OtherBookCardHomeComponent.swift
//  BebekWorkshop
//
//  Created by Andrew Oroh on 20/06/24.
//

import SwiftUI

struct OtherBookCardHomeComponent: View {
    var book:Book
    var body: some View {
        VStack{
            if let coverUrl = book.cover?.url,
               let imageData = try? Data(contentsOf: coverUrl),
               let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .frame(width: 177, height: 287)
                    .padding(.bottom, 16)
            } else {
                Image("book-cover-placeholder")
                    .resizable()
                    .frame(width: 177, height: 287)
                    .padding(.bottom, 16)
            }
            Text("\(book.title)")
                .font(Font.hostGrotesk(typography: .body))
                .bold()
            Text("\(book.authors ?? " ")")
                .font(Font.hostGrotesk(typography: .caption1))
                .foregroundStyle(Color.tertiaryAuthorName)
        }
    }
}

//#Preview {
//    OtherBookCardHomeComponent()
//}
