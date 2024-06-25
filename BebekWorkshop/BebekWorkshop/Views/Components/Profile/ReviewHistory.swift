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
            HStack (spacing:24){
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star")
                        Image(systemName: "star")
                        Image(systemName: "star")
                    }
                    Text("Could not get into this at all, never engaged me. The prose is so overdone at times - at one stage Eustace goes to get a bottle of wine from the cellar and it must take three pages of overblown prose")
                        .lineLimit(5)
                    Text("K. J. Charles")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
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
                    Text("One of those litfic fantasy novels where there's so much Beautiful Prose that you never actually find out what's going on. You say atmosphere of numinous mystery, I say a sphinx without a secret.")
                        .lineLimit(5)
                    Text("Adrian")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                .padding(.all, 20.0)
                .background(Color.secondaryLightblueBackground)
                .cornerRadius(10)
            } .padding(.horizontal, 40)
        }
    }
}

#Preview {
    ReviewHistory()
        .environmentObject(UserViewModel())
        .modelContainer(SampleData.shared.modelContainer)
}
