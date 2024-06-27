//
//  DetailView.swift
//  BebekWorkshop
//
//  Created by Alfadli Maulana Siddik on 13/06/24.
//

import SwiftUI
import SwiftData
import ReadiumNavigator

struct DetailView: View {
    @Environment(\.modelContext) private var context
    @EnvironmentObject var userViewModel : UserViewModel
    
    @State private var epubViewController : EPUBNavigatorViewController? = nil
    
    var book: Book
    
    var body: some View {
        VStack {
            if epubViewController == nil{
                ZStack {
                    UnevenRoundedRectangle(topLeadingRadius: 30, topTrailingRadius: 30)
                        .foregroundColor(Color.secondaryLightblueBackground)
                        .padding(.top, 190)
                    VStack {
                        
                        DetailHeader(epubViewController: $epubViewController, book: book)
                        
                        BookSynopsis(
                            text: "It is no small matter, after all, to create something—to make it so only by setting down the words. We forget the magnitude, sometimes, of that miracle. In the dead of night, shots ring out over the grounds of a sprawling English estate. The world-weary butler Eustace recognizes the gunman—his longtime employer, Mr. Crowe—and knows he must think and act quickly. Who is the man lying dead on the lawn? Who is the woman in his company? Can he clean up his master’s mess like he always has before? Or will this bring a new kind of reckoning?"
                        )
                        .padding(.bottom, 65)
                        
                        BookReviews()
                        
                        Spacer()
                    }
                    .padding(32)
                }
                .padding([.leading, .top, .trailing], 40)
            }else{
                    BookView(book: book, epubViewController: $epubViewController)                
            }
        }
        .padding(.top, 38)
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    DetailView(book: Book.sampleData[0])
        .environmentObject(UserViewModel())
        .modelContainer(SampleData.shared.modelContainer)
}
