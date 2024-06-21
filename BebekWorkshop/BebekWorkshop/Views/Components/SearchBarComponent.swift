//
//  SearchBarComponent.swift
//  BebekWorkshop
//
//  Created by Andrew Oroh on 20/06/24.
//

import SwiftUI

struct SearchBarComponent: View {
    @State var searchTextInput: String = ""
    var body: some View {
        ZStack{
            Rectangle()
                .frame(height: 77)
                .foregroundColor(Color.secondaryLightblue)
                .cornerRadius(50)
        }
        .padding(20)
    }
}

#Preview {
    SearchBarComponent()
}
