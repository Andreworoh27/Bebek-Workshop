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
<<<<<<< HEAD
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
=======
        VStack {
            SearchBarComponent()
                .padding(.horizontal, 20)
            ZStack {
                UnevenRoundedRectangle(topLeadingRadius: 30, topTrailingRadius: 30)
                    .foregroundColor(Color.secondaryLightblueBackground)
                    .padding(.top, 190)
                VStack {
                    DetailHeader(book: book)
                    
                    BookSynopsis(
                        text: "It is no small matter, after all, to create something—to make it so only by setting down the words. We forget the magnitude, sometimes, of that miracle. In the dead of night, shots ring out over the grounds of a sprawling English estate. The world-weary butler Eustace recognizes the gunman—his longtime employer, Mr. Crowe—and knows he must think and act quickly. Who is the man lying dead on the lawn? Who is the woman in his company? Can he clean up his master’s mess like he always has before? Or will this bring a new kind of reckoning?"
                    )
                    .padding(.bottom, 65)
                    
                    BookReviews()
                    
                    Spacer()
>>>>>>> development
                }
                .padding(32)
            }
            .padding([.leading, .top, .trailing], 40)
            .alert(isPresented: $userViewModel.showAlert) {
                Alert(
                    title: Text("Congratulations!"),
                    message: Text("You have achieved your goal!"),
                    dismissButton: .default(Text("Awesome!"))
                )
            }
        }
        .padding(.top, 38)
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
        DetailView(book: Book.sampleData[0])    .environmentObject(UserViewModel())
//    .modelContainer(SampleData.shared.modelContainer)
}
