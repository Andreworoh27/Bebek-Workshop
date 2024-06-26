////
////  ContentView.swift
////  BebekWorkshop
////
////  Created by Andrew Oroh on 11/06/24.
////
//
//import SwiftUI
//import SwiftData
//
//

import SwiftUI
import SwiftData


struct ContentView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(0)
            HistoryView().tabItem {
                    Label("History", systemImage: "list.bullet.rectangle.portrait")
                }
                .tag(1)
        }
        .font(Font.hostGrotesk(typography: .body))
    }
}

struct HistoryView: View {
    @Query private var readHistories: [ReadHistory]
    @EnvironmentObject var userViewModel: UserViewModel
    
    var totalReadingMinutesToday: Int {
        
        ReadHistory.accumulateReadingMinutesToday(readHistories: userViewModel.userHistories)
        
    }
    
    var body: some View {
        
        NavigationStack {
            List {
                Section("User View Model") {
                    ForEach(readHistories) { history in
                        
                        NavigationLink {
                            VStack {
                                Text(history.user?.name ?? "Tidak ada")
                                Text(history.book?.title ?? "Tidak ada")
                                Text(String(history.minutesRead))
                                Text(history.readDate.toString())
                            }
                        } label: {
                            Text(history.readDate.toString())
                        }
                    }
                }
                
                Section("Swift Data") {
                    ForEach(userViewModel.userHistories) { history in
                        NavigationLink {
                            VStack {
                                Text(history.user?.name ?? "Tidak ada")
                                Text(history.book?.title ?? "Tidak ada")
                                Text(String(history.minutesRead))
                                Text(history.readDate.toString())
                            }
                        } label: {
                            Text(history.readDate.toString())
                        }
                    }
                }

            }
            .navigationTitle("\(totalReadingMinutesToday)/\(userViewModel.userReadingGoal) Minutes Today")
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(UserViewModel())
        .environmentObject(ChallengeViewModel())
        .modelContainer(SampleData.shared.modelContainer)
}
