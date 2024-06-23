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
<<<<<<< HEAD:BebekWorkshop/BebekWorkshop/Views/Components/OtherBookCardHomeComponent.swift
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
=======
            Image("book-cover-placeholder")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.bottom, 16)
            Text("Book title")
>>>>>>> development:BebekWorkshop/BebekWorkshop/Views/Components/Home/OtherBookCardHomeComponent.swift
                .bold()
            Text("\(book.authors ?? " ")")
                .font(Font.hostGrotesk(typography: .caption1))
                .foregroundStyle(Color.secondaryBlueberry)
        }
    }
}

//#Preview {
//    OtherBookCardHomeComponent()
//}
