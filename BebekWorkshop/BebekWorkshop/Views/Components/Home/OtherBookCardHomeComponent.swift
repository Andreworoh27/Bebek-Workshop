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
                .aspectRatio(contentMode: .fit)
                .padding(.bottom, 16)
            Text("Book title")
                .bold()
            Text("Book Author")
                .font(Font.hostGrotesk(typography: .caption1))
                .foregroundStyle(Color.secondaryBlueberry)
        }
    }
}

#Preview {
    OtherBookCardHomeComponent()
}
