//
//  ContentView.swift
//  BebekWorkshop
//
//  Created by Andrew Oroh on 11/06/24.
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
    }
}

//struct HomeViewTest: View {
//    @Query private var books: [Book]
//    @EnvironmentObject var userViewModel: UserViewModel
//    
//    var body: some View {
//        NavigationStack {
//            VStack(alignment: .leading) {
//                Text("Self Help")
//                    .font(.headline)
//                    .padding(.leading, 15)
//                    .padding(.top, 5)
//                
//                ScrollView(.horizontal, showsIndicators: false) {
//                    HStack(alignment: .top, spacing: 0) {
//                        ForEach(books) { book in
//                            if (book.categories.contains("Self-help")) {
//                                NavigationLink {
//                                    DetailView(book: book)
//                                } label: {
//                                    CategoryItem(book: book)
//                                }
//                            }
//                        }
//                    }
//                }
//                Button(action: {
//                    print(User.sampleData[0].histories.count)
//                }, label: {
//                    /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
//                })
//            }
//        }
//    }
//}

struct HistoryView: View {
    @Query private var readHistories: [ReadHistory]
    @EnvironmentObject var userViewModel: UserViewModel
    
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
            }
            .navigationTitle("\(totalReadingMinutesToday)/\(User.sampleData[0].readingGoal) Minutes Today")
        }
    }
}

struct CategoryItem: View {
    var book: Book
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(book.image)
                .resizable()
                .frame(height: 205)
                .cornerRadius(5)
            Text(book.title)
                .font(.caption)
        }
        .padding(.leading, 15)
        .frame(width: 155)
    }
}

#Preview {
    ContentView()
        .environmentObject(UserViewModel())
        .modelContainer(SampleData.shared.modelContainer)
}
