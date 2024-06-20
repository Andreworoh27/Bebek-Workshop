//
//  CurrentlyReadBookCoverComponent.swift
//  BebekWorkshop
//
//  Created by Andrew Oroh on 20/06/24.
//

import SwiftUI

struct CurrentlyReadBookCoverComponent: View {
    var body: some View {
        VStack{
            Image("book-cover-placeholder")
                .resizable()
                .frame(width: 128,height: 207)
                .cornerRadius(10)
        }
    }
}

#Preview {
    CurrentlyReadBookCoverComponent()
}
