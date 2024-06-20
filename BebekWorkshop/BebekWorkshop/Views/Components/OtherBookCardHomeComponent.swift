//
//  OtherBookCardHomeComponent.swift
//  BebekWorkshop
//
//  Created by Andrew Oroh on 20/06/24.
//

import SwiftUI

struct OtherBookCardHomeComponent: View {
    var body: some View {
        VStack{
            Image("book-cover-placeholder")
                .resizable()
                .frame(width: 177,height: 287)
                .padding(.bottom, 16)
            Text("Book title")
                .font(Font.hostGrotesk(typography: .body))
                .bold()
            Text("Book Author")
                .font(Font.hostGrotesk(typography: .caption1))
                .foregroundStyle(Color.tertiaryAuthorName)
        }
    }
}

#Preview {
    OtherBookCardHomeComponent()
}
