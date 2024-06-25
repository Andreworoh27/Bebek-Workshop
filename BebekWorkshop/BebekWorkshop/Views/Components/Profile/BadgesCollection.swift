//
//  BadgesCollection.swift
//  BebekWorkshop
//
//  Created by Safira Humaira on 24/06/24.
//

import SwiftUI

struct BadgesCollection: View {
    var body: some View {
        VStack {
            HStack {
                Text("Achievements & Badges Collection")
                    .font(Font.hostGrotesk(typography: .largeTitle))
                    .multilineTextAlignment(.leading)
                    .bold()
                    .padding(.leading, 40.0)
                Spacer()
            }
            HStack {
                VStack {
                    ZStack {
                        Ellipse()
                            .frame(width: 185.0, height: 185.0)
                            .padding()
                            .foregroundColor(.gray)
                        Image("streakcat-disabled")
                            .resizable(capInsets: EdgeInsets())
                            .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                    }
                    Text("Reading Rookie")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    Text("First step to start\nyour reading journey ")
                        .font(.body)
                        .fontWeight(.regular)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                }
                VStack {
                    ZStack {
                        Ellipse()
                            .frame(width: 185.0, height: 185.0)
                            .padding()
                            .foregroundColor(.gray)
                        Image("streakcat-disabled")
                            .resizable(capInsets: EdgeInsets())
                            .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                    }
                    Text("Story Seeker")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    Text("Picking your first \n book to read")
                        .font(.body)
                        .fontWeight(.regular)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                }
                VStack {
                    ZStack {
                        Ellipse()
                            .frame(width: 185.0, height: 185.0)
                            .padding()
                            .foregroundColor(.gray)
                        Image("streakcat-disabled")
                            .resizable(capInsets: EdgeInsets())
                            .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                    }
                    Text("Chapter Champion")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Text("Completing first chapter \n of a book")
                        .font(.body)
                        .fontWeight(.regular)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                }
                
            }
        }
    }
}

#Preview {
    BadgesCollection()
}
