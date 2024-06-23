//
//  DetailHeader.swift
//  BebekWorkshop
//
//  Created by Alfadli Maulana Siddik on 22/06/24.
//

import SwiftUI

struct DetailHeader: View {
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
                        Text(book.title)
                            .font(Font.hostGrotesk(typography: .largeTitle))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
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
                    Button(action: {}, label: {
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
}

#Preview {
    DetailHeader(book: Book.sampleData[0])
}
