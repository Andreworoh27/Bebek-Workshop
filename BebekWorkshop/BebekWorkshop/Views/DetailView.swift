//
//  DetailView.swift
//  BebekWorkshop
//
//  Created by Alfadli Maulana Siddik on 13/06/24.
//

import SwiftUI

struct DetailView: View {
    @State var showAlert: Bool = false
    @EnvironmentObject var userViewModel: UserViewModel
    
    var book: Book
    
    var body: some View {
        SearchBarComponent()
        HStack {
            if let coverUrl = book.cover?.url,
               let imageData = try? Data(contentsOf: coverUrl),
               let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .frame(width: 177, height: 287)
                    .padding(.bottom, 16)
            } else {
                Image("book-cover-placeholder")
                    .resizable()
                    .frame(width: 177, height: 287)
                    .padding(.bottom, 16)
            }
            
            VStack(alignment: .leading) {
                Text(book.title)
                Text(book.authors ?? " ")
                NavigationLink {
                    BookView(book: book)
                } label: {
                    Text("Read")
                        .foregroundStyle(.black)
                        .padding()
                        .background(.orange)
                        .clipShape(.buttonBorder)
                }
            }
        }
        .alert(isPresented: $userViewModel.showAlert) {
            Alert(
                title: Text("Congratulations!"),
                message: Text("You have achieved your goal!"),
                dismissButton: .default(Text("Awesome!"))
            )
        }
    }
}

#Preview {
        DetailView(book: Book.sampleData[0])    .environmentObject(UserViewModel())
//    .modelContainer(SampleData.shared.modelContainer)
}
