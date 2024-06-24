//
//  DetailHeader.swift
//  BebekWorkshop
//
//  Created by Alfadli Maulana Siddik on 22/06/24.
//

import SwiftUI
import SwiftData
import ReadiumNavigator
import ReadiumAdapterGCDWebServer

struct DetailHeader: View {
    @Environment(\.modelContext) private var context
    @EnvironmentObject var userViewModel : UserViewModel
    //    @Query (filter: #Predicate<ReadHistory> {history in
    //        history.book == book && history.user == userViewModel.currentLogUser
    //    }) let readHistories : [ReadHistory]
    @Query var readHistories : [ReadHistory]
    @Binding  var epubViewController : EPUBNavigatorViewController?

    var book: Book
    var body: some View {
        HStack {
            if let coverUrl = book.cover?.url,
               let imageData = try? Data(contentsOf: coverUrl),
               let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                Image("book-cover-placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            VStack {
                VStack(alignment: .leading, spacing: 6) {
                    HStack {
                        VStack(alignment: .leading){
                            Text(book.title)
                                .font(Font.hostGrotesk(typography: .largeTitle))
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            Text(book.authors ?? "Unknown Author(s)")
                                .font(Font.hostGrotesk(typography: .body))
                        }
                        Spacer()
                        HStack(spacing: 16) {
                            Image(systemName: "bookmark")
                            Image(systemName: "square.and.arrow.up")
                        }
                        .font(.system(size: 28))
                    }
                    //                    Text(book.authors?.first)
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    Button(action: {
                        let exist = checkIfBookExistInDatabase()
                        if !exist {
                            let readHistory = ReadHistory(user: userViewModel.currentLogUser,book:book, minutesRead: 0, currentPage: 0, bookStatus: "read", readDate: Date.now)
                            context.insert(readHistory)
                            do {
                                try context.save()
                            } catch {
                                print("failed to save reading history when open book")
                            }
                        }
                        
                        Task{
                            await previewBook()
                        }
                        
                        
                    }, label: {
                        Text("Start Reading")
                            .font(Font.hostGrotesk(typography: .headline))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    })
                    .padding(.vertical, 10)
                    .padding(.horizontal, 30)
                    .foregroundColor(.white)
                    .background(Color.tertiaryBlush)
                    .cornerRadius(25)
                }
                
                Spacer()
                
                HStack(spacing: 50) {
                    VStack(spacing: 6) {
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.tertiaryMexican)
                            Text("3,82")
                                .font(Font.hostGrotesk(typography: .title1))
                        }
                        Text("Rating")
                            .font(Font.hostGrotesk(typography: .caption1))
                    }
                    
                    VStack(spacing: 6) {
                        HStack {
                            Image(systemName: "doc.text")
                                .foregroundColor(.tertiaryMexican)
                            Text("298")
                                .font(Font.hostGrotesk(typography: .title1))
                        }
                        Text("Rating")
                            .font(Font.hostGrotesk(typography: .caption1))
                    }
                    
                    VStack(spacing: 6) {
                        HStack {
                            Image(systemName: "eyeglasses")
                                .foregroundColor(.tertiaryMexican)
                            Text("Mystery")
                                .font(Font.hostGrotesk(typography: .title1))
                        }
                        Text("Genre")
                            .font(Font.hostGrotesk(typography: .caption1))
                    }
                }
            }
            .padding(.leading, 16)
        }
        .frame(height: 311)
        .padding(.bottom, 44)
    }
    
    func checkIfBookExistInDatabase()-> Bool{
        var valid : Bool = false
        readHistories.forEach { readHistory in
            if(readHistory.book == book && readHistory.user == userViewModel.currentLogUser){
                 valid = true
            }
        }
        return valid
    }
    
    func previewBook() async{
        let bookService = BookServices()
        do {
            let pub = try await bookService.openBook(book)
            let readerViewController = try EPUBNavigatorViewController(publication: pub, initialLocation: nil, httpServer: GCDHTTPServer.shared)
            epubViewController = readerViewController
            
        } catch{
            print("preview book error")
        }
    }
}

//#Preview {
//    DetailHeader(book: Book.sampleData[0], epubViewController: .constant(EPUBNavigatorViewController()))
//}
