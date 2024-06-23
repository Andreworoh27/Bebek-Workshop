//
//  BookReviews.swift
//  BebekWorkshop
//
//  Created by Alfadli Maulana Siddik on 22/06/24.
//

import SwiftUI

struct BookReviews: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("Reviews")
                    .font(Font.hostGrotesk(typography: .title1))
                Image(systemName: "chevron.right")
                    .font(.system(size: 28))
                Spacer()
                HStack {
                    Image(systemName: "square.and.pencil")
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Write a review")
                            .foregroundStyle(Color.secondaryBlueberry)
                    })
                }
            }
            LazyVGrid(columns: columns, spacing: 24)
            {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Not Rated")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text("One of those litfic fantasy novels where there's so much Beautiful Prose that you never actually find out what's going on. You say atmosphere of numinous mystery, I say a sphinx without a secret.")
                        .lineLimit(5)
                    Text("K. J. Charles")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                
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
                .padding()
                .background(Color.white)
                .cornerRadius(10)
            }
        }
    }
}

#Preview {
    BookReviews()
}
