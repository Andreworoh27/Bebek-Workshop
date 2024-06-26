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
                    .padding(.leading, 40.0)
                Spacer()
            }
            ScrollView([.horizontal]){
                HStack (spacing:24){
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star")
                            Image(systemName: "star")
                            Image(systemName: "star")
                        }
                        Text("Could not get into this at all, never\n engaged me. The prose is so\n overdone at times - at one stage\n Eustace goes to get a bottle of wine\n from the cellar and it must take three\n pages of overblown prose")
                            .lineLimit(5)
                        Text("K. J. Charles")
                            .fontWeight(.bold)
                    }
                    .padding(.all, 20.0)
                    .background(Color.secondaryLightblueBackground)
                    .cornerRadius(10)
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star")
                            Image(systemName: "star")
                        }
                        Text("One of those litfic fantasy novels\n where there's so much Beautiful Prose\n that you never actually find out\n what's going on. You say atmosphere\n of numinous mystery, I say a sphinx\n without a secret.")
                            .lineLimit(5)
                        Text("Adrian")
                            .fontWeight(.bold)
                    }
                    .padding(.all, 20.0)
                    .background(Color.secondaryLightblueBackground)
                    .cornerRadius(10)
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star")
                        }
                        Text("A wonderfully strange novel written\n gorgeously. I do think the clarity of\n the story gets a bit lost in the writing\n at times and the ending felt rushed\n and confusing, but for a first novel,\n this is really something.")
                            .lineLimit(5)
                        Text("Alice")
                            .fontWeight(.bold)
                    }
                    .padding(.all, 20.0)
                    .background(Color.secondaryLightblueBackground)
                    .cornerRadius(10)
                }
            }.padding(.horizontal, 40)
        }
    }
}

#Preview {
    ReviewHistory()
        .environmentObject(UserViewModel())
        .modelContainer(SampleData.shared.modelContainer)
}
