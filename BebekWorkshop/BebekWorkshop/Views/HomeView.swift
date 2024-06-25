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
    
    static var descriptor: FetchDescriptor<Book> {
        var descriptor = FetchDescriptor<Book>(sortBy: [SortDescriptor(\.title)])
        descriptor.fetchLimit = 8
        return descriptor
    }
    
    @Query(descriptor) var allBooks: [Book]
    @Query var allUsers:[User]
    @Query var currentlyReadBooks : [ReadHistory]
    
    @State var showAlert: Bool = false
    
    let columns = [
        GridItem(.adaptive(minimum: 177))
    ]
    
    var timeUntilGoalReached: Int {
        let time = userViewModel.userReadingGoal - ReadHistory.accumulateReadingMinutesToday(readHistories: userViewModel.userHistories)
        
        if time > 0 {
            return time
        } else {
            return 0
        }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                SearchBarComponent()
                    .padding(.horizontal, 20)
                    .padding(.top, 38)
                    .padding(.bottom, 58)
                
                VStack{
                    HStack{
                        Text("Currently Reading")
                            .font(Font.hostGrotesk(typography: .largeTitle))
                            .bold()
                        
                        Spacer()
                        
                        Text("\(timeUntilGoalReached) minutes left")
                            .font(Font.hostGrotesk(typography: .headline))
                        
                        Text("to hit your goal")
                            .font(Font.hostGrotesk(typography: .body))
                    }
                    .padding(.horizontal, 40.0)
                    
                    ScrollView([.horizontal]){
                        HStack(spacing: 16){
                                
                            if let user = userViewModel.currentLogUser {
                                ForEach(ReadHistory.getCurrentReadingBooks(user: user), id: \.self){ book in
                                        NavigationLink {
                                            DetailView(book: book)
                                        } label: {
                                            CurrentlyReadBookCoverComponent(book: book)
                                        }
                                }
                            } else {
                                Text("No Current Read Books")
                            }
                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: 40, bottom: 38, trailing: -40))
                    
                    DailyGoalHomeProgressComponent(selectedOption: userViewModel.userReadingGoal)
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
            .padding(.top, 38)
            .onAppear{
                // create user if there is no user for testing.
                if(allUsers.isEmpty){
                    let newUser = User(name: "Bebek", username: "bebekworkshop", email: "bebek@mail.com", password: "bebekworkshop", readingGoal: 3, preferedGenres: ["development","tech","design"], streak: 0, longestStreak: 5, streakFreeze: 1)
                    
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
                
                if(allBooks.isEmpty){
                    Task{
                        do {
                            try await generateInitialBooksData()

                        } catch {
                            print("failed to generate initial books")
                        }
                    }
                }
            }
        }
        .overlay {
            if userViewModel.showAlert == true {
                ZStack {
                    VStack {
                        HStack {
                            Spacer()
                            Image(systemName: "multiply")
                                .font(.system(size: 34))
                                .bold()
                                .foregroundColor(.white)
                                .onTapGesture {
                                    userViewModel.showAlert = false
                                }
                        }
                        Spacer()
                    }
                    VStack {
                        Image("goal-achieved")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 570)
                            .padding(.leading, 54)
                        Text("You have reached your goal!")
                            .font(Font.hostGrotesk(typography: .largeTitle))
                            .foregroundStyle(.white)
                        Button {
                            userViewModel.showAlert = false
                        } label: {
                            Text("Continue Reading")
                                .foregroundStyle(Color.white)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 22)
                        }
                        .background(Color.secondaryBlueberry)
                        .cornerRadius(20)

                    }
                    Spacer()
                }
                .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .padding(48)
                .background(Color.black.opacity(0.75))
            }
        }
        .ignoresSafeArea()
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
        
        newUser.histories.append(ReadHistory(minutesRead: 5, currentPage: 7, bookStatus: "reading", readDate: ISO8601DateFormatter().date(from: "2024-06-23T00:00:00Z") ?? Date()))
        newUser.histories.append(ReadHistory(minutesRead: 5, currentPage: 7, bookStatus: "reading", readDate: ISO8601DateFormatter().date(from: "2024-06-24T00:00:00Z") ?? Date()))
        
        try context.save()
    }
}

#Preview {
    HomeView()
        .environmentObject(UserViewModel())
        .modelContainer(SampleData.shared.modelContainer)
}
