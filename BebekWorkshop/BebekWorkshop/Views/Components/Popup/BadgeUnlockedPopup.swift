//
//  BadgeUnlockedPopup.swift
//  BebekWorkshop
//
//  Created by Alfadli Maulana Siddik on 26/06/24.
//

import SwiftUI
import SwiftData

struct BadgeUnlockedPopup: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @Query var badges: [Badge]
    
    var badge: Badge
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: "multiply")
                        .font(.system(size: 34))
                        .bold()
                        .foregroundColor(.white)
                        .onTapGesture {
                            if let user = userViewModel.currentLogUser {
                                user.badges.append(badge)
                            }
                        }
                }
                Spacer()
            }
            ZStack {
                VStack {
                    Image("congrats")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 360)
                    Spacer()
                }
                VStack(spacing: 60) {
                    Image(badge.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 433)
                    Text("New Badge Unlocked!")
                        .font(Font.hostGrotesk(typography: .largeTitle))
                        .foregroundStyle(.white)
                }
            }.frame(height: 800)
        }
        .frame(maxHeight: .infinity)
        .padding(48)
        .background(Color.black.opacity(0.75))
    }
}

#Preview {
    BadgeUnlockedPopup(badge: Badge.sampleData[0])
}
