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
            }
        }
        .blur(radius: userViewModel.showProfile ? 16 : 0)
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
                .frame(maxHeight: .infinity)
                .padding(48)
                .background(Color.black.opacity(0.75))
            }
            
            if userViewModel.showProfile == true {
                VStack (spacing: 32) {
                    ZStack {
                        Text("Profile")
                        HStack {
                            Spacer()
                            Button {
                                userViewModel.showProfile = false
                            } label: {
                                Text("Done")
                            }
                        }
                    }
                    .padding([.leading, .top, .trailing], 40)
                    ProfileView()
                }
                
                .background(Color.white)
                .cornerRadius(30)
                .padding(.horizontal, 120)
                .shadow(
                    color: Color(red: 0, green: 0, blue: 0, opacity: 0.50), radius: 10, x: 0, y: 0
                )
                
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
}

#Preview {
    HomeView()
        .environmentObject(UserViewModel())
        .environmentObject(ChallengeViewModel())
        .modelContainer(SampleData.shared.modelContainer)
}
