//
//  ReviewHistory.swift
//  BebekWorkshop
//
//  Created by Safira Humaira on 25/06/24.
//

import SwiftUI

struct ReviewHistory: View {
    var body: some View {
        VStack {
            HStack {
                Text("Explore your past reviews")
                    .font(Font.hostGrotesk(typography: .largeTitle))
                    .multilineTextAlignment(.leading)
                    .bold()
                Spacer()
            }
            ScrollView([.horizontal]){
                HStack (spacing:24){
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Could not get into this at all, never\n engaged me. The prose is so\n overdone at times - at one stage\n Eustace goes to get a bottle of wine\n from the cellar and it must take three\n pages of overblown prose")
                            .lineLimit(5)
                        Text("Cinderella, chapter 1, Page 5")
                            .fontWeight(.bold)
                    }
                    .padding(.all, 20.0)
                    .background(Color.secondaryLightblueBackground)
                    .cornerRadius(10)
                    .shadow(
                        color: Color(red: 0, green: 0, blue: 0, opacity: 0.10), radius: 4, x: 4, y: 4
                    )
                    VStack(alignment: .leading, spacing: 10) {
                        Text("One of those litfic fantasy novels\n where there's so much Beautiful Prose\n that you never actually find out\n what's going on. You say atmosphere\n of numinous mystery, I say a sphinx\n without a secret.")
                            .lineLimit(5)
                        Text("Cinderella, chapter 1, Page 5")
                            .fontWeight(.bold)
                    }
                    .padding(.all, 20.0)
                    .background(Color.secondaryLightblueBackground)
                    .cornerRadius(10)
                    .shadow(
                        color: Color(red: 0, green: 0, blue: 0, opacity: 0.10), radius: 4, x: 4, y: 4
                    )
                    VStack(alignment: .leading, spacing: 10) {
                        Text("A wonderfully strange novel written\n gorgeously. I do think the clarity of\n the story gets a bit lost in the writing\n at times and the ending felt rushed\n and confusing, but for a first novel,\n this is really something.")
                            .lineLimit(5)
                        Text("Cinderella, chapter 1, Page 5")
                            .fontWeight(.bold)
                    }
                    .padding(20)
                    .background(Color.secondaryLightblueBackground)
                    .cornerRadius(10)
                    .shadow(
                        color: Color(red: 0, green: 0, blue: 0, opacity: 0.10), radius: 4, x: 4, y: 4
                    )
                }
            }
        }
    }
}

#Preview {
    ReviewHistory()
        .environmentObject(UserViewModel())
        .modelContainer(SampleData.shared.modelContainer)
}
