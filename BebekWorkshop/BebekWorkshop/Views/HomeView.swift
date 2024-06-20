//
//  HomeView.swift
//  BebekWorkshop
//
//  Created by Andrew Oroh on 20/06/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack{
            SearchBarComponent()
            ScrollView{
                VStack{
                    HStack{
                        Text("Currently Reading")
                            .font(Font.hostGrotesk(typography: .largeTitle))
                            .bold()
                        
                        Spacer()
                        
                        Text("\("10") minutes left")
                            .font(Font.hostGrotesk(typography: .headline))

                        Text("to hit your goal")
                            .font(Font.hostGrotesk(typography: .body))
                    }
                    
                    ScrollView([.horizontal]){
                        HStack(spacing: 16){
                            CurrentlyReadBookCoverComponent()
                            CurrentlyReadBookCoverComponent()
                            CurrentlyReadBookCoverComponent()
                            CurrentlyReadBookCoverComponent()
                            CurrentlyReadBookCoverComponent()
                            CurrentlyReadBookCoverComponent()
                            CurrentlyReadBookCoverComponent()
                            CurrentlyReadBookCoverComponent()
                            CurrentlyReadBookCoverComponent()
                            CurrentlyReadBookCoverComponent()
                            CurrentlyReadBookCoverComponent()
                            CurrentlyReadBookCoverComponent()
                        }
                    }
                    .padding(.bottom,38)
                    
                    DailyGoalHomeProgressComponent()
                        .padding(.bottom,58)
                    
                    HStack{
                        Text("Other Books You Might Like")
                            .font(Font.hostGrotesk(typography: .largeTitle))
                            .bold()
                        Spacer()
                    }
                    .padding(.bottom, 19)
                    
                    // create container to wrap books.
                    HStack(spacing: 10){
                        OtherBookCardHomeComponent()
                        OtherBookCardHomeComponent()
                        OtherBookCardHomeComponent()
                        OtherBookCardHomeComponent()
                    }
                    .padding(.top, 19)
                    
                    
                }
                .padding([.leading,.trailing],40)
                .padding(.top, 58)
            }
        }
    }
}

#Preview {
    HomeView()
}
