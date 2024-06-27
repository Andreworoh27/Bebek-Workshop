//
//  BadgesCollection.swift
//  BebekWorkshop
//
//  Created by Safira Humaira on 24/06/24.
//

import SwiftUI
import SwiftData

struct BadgesCollection: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @Query var badges: [Badge]
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Achievements & Badges Collection")
                    .font(Font.custom("HostGrotesk-Bold", size: 31))
                    .multilineTextAlignment(.leading)
                    .bold()
                Spacer()
            }
            ScrollView([.horizontal]){
                HStack(spacing: 28) {
                    ForEach(userViewModel.userBadges) { badge in
                        VStack(spacing: 12) {
                            Image(badge.image)
                                .resizable()
                                .scaledToFit()
                            VStack(spacing: 4) {
                                Text(badge.name)
                                    .font(Font.hostGrotesk(typography: .headline))
                                    .fontWeight(.bold)
                                .foregroundColor(.black)
                                Text(badge.badgeDescription)
                                    .font(Font.hostGrotesk(typography: .footnote))
                                    .fontWeight(.regular)
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.center)
                            }
                        }
                        .frame(width: 150)
                    }
                    
                    ForEach(badges.filter { !userViewModel.userBadges.contains($0) }) { badge in
                        VStack(spacing: 12) {
                            Image(badge.imagePlaceholder)
                                .resizable()
                                .scaledToFit()
                            VStack(spacing: 4) {
                                Text(badge.name)
                                    .font(Font.hostGrotesk(typography: .headline))
                                    .fontWeight(.bold)
                                .foregroundColor(.black)
                                Text(badge.badgeDescription)
                                    .font(Font.hostGrotesk(typography: .footnote))
                                    .fontWeight(.regular)
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.center)
                            }
                        }
                        .frame(width: 150)
                    }
                }
            }
        }
    }
}

#Preview {
    BadgesCollection()
        .environmentObject(UserViewModel())
        .modelContainer(SampleData.shared.modelContainer)
}
