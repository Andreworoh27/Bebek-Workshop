//
//  BookView.swift
//  BebekWorkshop
//
//  Created by Alfadli Maulana Siddik on 13/06/24.
//

import SwiftUI

struct BookView: View {
    var book: Book
    @StateObject var viewModel: ReadingViewModel = ReadingViewModel()
    
    var body: some View {
        VStack {
            Text("Pengguna lagi baca buku")   
            Text(viewModel.durationCounter.elapsedTime)
        }
        .onAppear(perform: {
            viewModel.toggleTracking()
        })
        .onDisappear(perform: {
            let minutes = viewModel.durationCounter.seconds > 30 ? viewModel.durationCounter.minutes + 1 : viewModel.durationCounter.minutes
            print(minutes)
            viewModel.toggleTracking()
            
        })
    }
}

#Preview {
    NavigationStack {
        BookView(book: Book.sampleData[0])
    }
}
