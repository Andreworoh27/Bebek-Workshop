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
    @Query var allUsers: [User]
    @Query var currentlyReadBooks : [ReadHistory]
    @Query var badges : [Badge]
    
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
                    .padding(.bottom, 41)
                
                VStack{
                    DailyGoalHomeProgressComponent(selectedOption: userViewModel.userReadingGoal, showStats: false)
                        .padding(.horizontal, 40)
                        .padding(.bottom, 47)
                        .foregroundColor(.black)

                    HStack{
                        Text("Continue Reading")
                            .font(Font.hostGrotesk(typography: .largeTitle))
                            .bold()
                        
                        Spacer()
                    }
                    .padding(.horizontal, 40.0)
                    
                    ScrollView([.horizontal]){
                        HStack(spacing: 16){
                            
                            if let user = userViewModel.currentLogUser {
                                if user.histories.count == 0 {
                                    Text("No Current Read Books")
                                } else {
                                    ForEach(ReadHistory.getCurrentReadingBooks(user: user), id: \.self){ book in
                                        NavigationLink {
                                            DetailView(book: book)
                                        } label: {
                                            CurrentlyReadBookCoverComponent(book: book)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: 40, bottom: 48, trailing: -40))
                    
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
                
                if(badges.isEmpty){
                    Task{
                        do {
                            try insertInitialBadge()
                        } catch {
                            print("failed to generate initial badges")
                        }
                    }
                }
            }
        }
        .blur(radius: userViewModel.showProfile ? 16 : 0)
        .overlay {
            Group {
                if userViewModel.showAlert == true {
                    GoalReachedPopup()
                }
                
                if userViewModel.showProfile == true {
                    ProfilePopup()
                }
                
                if userViewModel.userBadges.count == 0 {
                    BadgeUnlockedPopup(badge: badges.filter{$0.name == "Reading Rookie"}[0])
                }
                
                if userViewModel.userBadges.filter({$0.name == "Story Seeker"}).isEmpty && userViewModel.userHistories.count == 1 {
                    BadgeUnlockedPopup(badge: badges.filter{$0.name == "Story Seeker"}[0])
                }
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
        
        try context.save()
    }
    
    func insertInitialBadge() throws{
        for badge in Badge.sampleData {
            context.insert(badge)
        }
        
        try context.save()
    }
}

#Preview {
    HomeView()
        .environmentObject(UserViewModel())
        .environmentObject(ChallengeViewModel())
        .modelContainer(SampleData.shared.modelContainer)
}
