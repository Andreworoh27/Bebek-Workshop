//
//  BookView.swift
//  BebekWorkshop
//
//  Created by Alfadli Maulana Siddik on 13/06/24.
//

import SwiftUI
import ReadiumNavigator

struct BookView: View {
    var book: Book
    @StateObject var readingViewModel: ReadingViewModel = ReadingViewModel()
    @EnvironmentObject var userViewModel: UserViewModel
    
    @Environment(\.modelContext) private var context
    @Binding var epubViewController : EPUBNavigatorViewController?
    
    var body: some View {
        VStack {
            ReaderViewContainer(vc: epubViewController)
        }
        .onAppear(perform: {
            readingViewModel.toggleTracking()
        })
        .onDisappear(perform: {
            let minutes = readingViewModel.durationCounter.seconds > 0 ? readingViewModel.durationCounter.minutes + 1 : readingViewModel.durationCounter.minutes
            let newReadHistory = ReadHistory(
                minutesRead: minutes,
                currentPage: 5,
                bookStatus: "reading",
                readDate: Date()
            )
            
            context.insert(newReadHistory)
            
            newReadHistory.book = book
            newReadHistory.user = userViewModel.currentLogUser
            
            do {
                try context.save()
            } catch {
                print("Error when inserting sample data: \(error)")
            }
            
            if (ReadHistory.accumulateReadingMinutesToday(readHistories: userViewModel.userHistories) >= userViewModel.userReadingGoal && userViewModel.alertHasShown == false)
            {
                userViewModel.showAlert = true
                userViewModel.alertHasShown = true
            }
            
            readingViewModel.toggleTracking()
        })
    }
}

//#Preview {
//    NavigationStack {
//        BookView(book: Book.sampleData[0])
//    }
//    .environmentObject(UserViewModel())
////    .modelContainer(SampleData.shared.modelContainer)
//}
