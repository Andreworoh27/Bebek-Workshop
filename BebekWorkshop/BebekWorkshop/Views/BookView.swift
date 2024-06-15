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
            Text("Pengguna \(userViewModel.currentUser.name) lagi baca buku")   
            Text(readingViewModel.durationCounter.elapsedTime)
        }
        .onAppear(perform: {
            readingViewModel.toggleTracking()
        })
        .onDisappear(perform: {
            let minutes = readingViewModel.durationCounter.seconds > 30 ? readingViewModel.durationCounter.minutes + 1 : readingViewModel.durationCounter.minutes
            let newReadHistory = ReadHistory(
                user: User.sampleData[0],
                book: book,
                minutesRead: minutes,
                currentPage: 5,
                bookStatus: "reading",
                readDate: Date()
            )
            context.insert(newReadHistory)
            
            readingViewModel.toggleTracking()
        })
    }
}

#Preview {
    NavigationStack {
        BookView(book: Book.sampleData[0])
    }
    .environmentObject(UserViewModel())
    .modelContainer(SampleData.shared.modelContainer)
}
