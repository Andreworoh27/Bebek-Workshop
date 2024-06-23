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

//struct HomeViewTest: View {
//    @Query private var books: [Book]
//    @EnvironmentObject var userViewModel: UserViewModel
//    
//    var body: some View {
//        TabView {
//            HomeView()
//                .tabItem {
//                    Label("Home", systemImage: "house.fill")
//                }
//                .tag(0)
//            HistoryView().tabItem {
//                Label("History", systemImage: "list.bullet.rectangle.portrait")
//            }
//            .tag(1)
//        }
//    }
//}

struct HistoryView: View {
    @Query private var readHistories: [ReadHistory]
    @EnvironmentObject var userViewModel: UserViewModel
    
    @Query private var reviews: [Review]
    
    var totalReadingMinutesToday: Int {
        ReadHistory.accumulateReadingMinutesToday(readHistories: readHistories)
    }
    
    var body: some View {
        NavigationStack {
            List {
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
                
                ForEach(reviews) { review in
                    NavigationLink {
                        VStack {
                            Text(review.user?.name ?? "Tidak ada")
                            Text(review.book?.title ?? "Tidak ada")
                            Text(String(review.rating))
                            Text(review.reviewText)
                        }
                    } label: {
                        Text(review.reviewText)
                    }
                }

            }
            .navigationTitle("\(totalReadingMinutesToday)/\(User.sampleData[0].readingGoal) Minutes Today")
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(UserViewModel())
        .modelContainer(SampleData.shared.modelContainer)
}
