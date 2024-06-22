//
//  HomeView.swift
//  BebekWorkshop
//
//  Created by Andrew Oroh on 20/06/24.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    
    @Environment(\.modelContext)private var context
    @Query var allBooks:[Book]
    
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

                            ForEach(allBooks, id: \.self){ book in
                                OtherBookCardHomeComponent(book: book)
                            }
                        }
                    }
                    .padding([.bottom, .leading, .trailing], 40)
                }
            }
            
        }
        .onAppear{
            if(allBooks.isEmpty){
                Task{
                    do{
                        try await generateInitialBooksData()
                    }catch{
                        print("failed to generate book in homeview")
                    }
                }
                print("\(context.insertedModelsArray.count)")
            }
        }
        .padding(.top, 38)
    }
    
    func generateInitialBooksData()async throws{
        let books = await generateBook()
        for book in books {
            context.insert(book)
        }
        
        try context.save()
        
    }
}

//#Preview {
//    HomeView()
//}
