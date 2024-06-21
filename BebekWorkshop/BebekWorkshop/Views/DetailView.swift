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
            Image(book.image)
            VStack(alignment: .leading) {
                Text(book.title)
                Text(book.author)
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
    NavigationStack {
        DetailView(book: Book.sampleData[0])
    }
    .environmentObject(UserViewModel())
    .modelContainer(SampleData.shared.modelContainer)
}
