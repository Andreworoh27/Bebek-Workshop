//
//  HomeView.swift
//  BebekWorkshop
//
//  Created by Andrew Oroh on 20/06/24.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    
    @Environment(\.modelContext) private var context
    @EnvironmentObject var userViewModel : UserViewModel
    @Query var allBooks:[Book]
    @Query var allUsers:[User]
    @Query var currentlyReadBooks : [ReadHistory]
    
    let columns = [
        GridItem(.adaptive(minimum: 177))
    ]
    var body: some View {
        NavigationStack {
            VStack {
                SearchBarComponent(user: userViewModel.currentLogUser)
                    .padding(.horizontal, 20)
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
                                if(currentlyReadBooks.isEmpty){
                                    Text("you haven't read any book")
                                }
                                
                                else{
                                    ForEach(currentlyReadBooks, id: \.self){ currentlyReadBook in
                                        NavigationLink {
                                            DetailView(book: currentlyReadBook.book!)
                                        } label: {
                                            CurrentlyReadBookCoverComponent(book: currentlyReadBook.book!)
                                        }
                                    }
                                }
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
                            LazyVGrid(columns: columns, spacing: 24)
                            {
                                ForEach(allBooks, id: \.self){ book in
                                    NavigationLink{
                                        DetailView(book: book)
                                    } label:{
                                        OtherBookCardHomeComponent(book: book)
                                    }
                                }
                            }
                        }
                        .padding([.bottom, .leading, .trailing], 40)
                    }
                }
            }
            .padding(.top, 38)
            .ignoresSafeArea(edges: .bottom)
            .onAppear{
                // create user if there is no user for testing.
                if(allUsers.isEmpty){
                    let newUser = User(name: "Bebek", username: "bebekworkshop", email: "bebek@mail.com", password: "bebekworkshop", readingGoal: 10, preferedGenres: ["development","tech","design"], streak: 0)
                    
                    do {
                        try insertInitialUser(newUser: newUser)
                        
                    } catch {
                        print("failed to insert initial user")
                    }
                }
                
                if(userViewModel.currentLogUser == nil){
                    //                    userViewModel.setCurrentLogUser(user: User.sampleData[0])
                    userViewModel.setCurrentLogUser(user: allUsers.first!)
                    
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
    }
    
    func generateInitialBooksData()async throws{
        let books = await generateBook()
        for book in books {
            context.insert(book)
        }
        
        try context.save()
    }
    
    func insertInitialUser(newUser : User) throws{
        context.insert(newUser)
        try context.save()
    }
}

#Preview {
    HomeView()
        .environmentObject(UserViewModel())
        .modelContainer(SampleData.shared.modelContainer)
}
