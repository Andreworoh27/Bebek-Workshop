//
//  BookView.swift
//  BebekWorkshop
//
//  Created by Alfadli Maulana Siddik on 13/06/24.
//

import SwiftUI

struct BookView: View {
    var book: Book
    @StateObject var readingViewModel: ReadingViewModel = ReadingViewModel()
    @EnvironmentObject var userViewModel: UserViewModel
    
    @Environment(\.modelContext) private var context
    
    var body: some View {
        VStack {
            Text("Pengguna \(User.sampleData[0].name) lagi baca buku")
            Text(readingViewModel.durationCounter.elapsedTime)
        }
        .onAppear(perform: {
            readingViewModel.toggleTracking()
        })
        .onDisappear(perform: {
            let minutes = readingViewModel.durationCounter.seconds > 5 ? readingViewModel.durationCounter.minutes + 1 : readingViewModel.durationCounter.minutes
            let newReadHistory = ReadHistory(
                minutesRead: minutes,
                currentPage: 5,
                bookStatus: "reading",
                readDate: Date()
            )
            context.insert(newReadHistory)
            
            newReadHistory.book = book
            newReadHistory.user = User.sampleData[0]
            
            do {
                try context.save()
            } catch {
                print("Error when inserting sample data: \(error)")
            }
            
            if (ReadHistory.accumulateReadingMinutesToday(readHistories: User.sampleData[0].histories) >= User.sampleData[0].readingGoal && userViewModel.alertHasShown == false)
            {
                userViewModel.showAlert = true
                userViewModel.alertHasShown = true
            }
            
            readingViewModel.toggleTracking()
        })
    }
}

#Preview {
    NavigationStack {
        BookView(book: Book.sampleData[0])
    }
    .environmentObject(UserViewModel())
//    .modelContainer(SampleData.shared.modelContainer)
}
