//
//  HomeView.swift
//  BebekWorkshop
//
//  Created by Andrew Oroh on 20/06/24.
//

import SwiftUI

struct HomeView: View {
    let columns = [
        GridItem(.adaptive(minimum: 177))
    ]
    var body: some View {
        VStack {
            SearchBarComponent()
                .padding(.bottom, 58)
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
                    .padding(.horizontal, 40.0)
                    
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
                    .padding(EdgeInsets(top: 0, leading: 40, bottom: 38, trailing: -40))
                    
                    DailyGoalHomeProgressComponent()
                        .padding(.bottom, 58)
                    
                    VStack {
                        HStack{
                            Text("Other Books You Might Like")
                                .font(Font.hostGrotesk(typography: .largeTitle))
                                .bold()
                            Spacer()
                        }
                        .padding(.bottom, 29)
                        
                        // create container to wrap books.
                        LazyVGrid(columns: columns, spacing: 10)
                        {
                            OtherBookCardHomeComponent()
                            OtherBookCardHomeComponent()
                            OtherBookCardHomeComponent()
                            OtherBookCardHomeComponent()
                            OtherBookCardHomeComponent()
                            OtherBookCardHomeComponent()
                        }
                    }
                    .padding([.bottom, .leading, .trailing], 40)
                }
            }
        }
        .padding(.top, 38)
    }
}

#Preview {
    HomeView()
}
