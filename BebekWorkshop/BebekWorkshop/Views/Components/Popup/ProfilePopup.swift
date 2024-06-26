//
//  ProfilePopup.swift
//  BebekWorkshop
//
//  Created by Alfadli Maulana Siddik on 26/06/24.
//

import SwiftUI

struct ProfilePopup: View {
    @EnvironmentObject var userViewModel: UserViewModel
    var body: some View {
        VStack (spacing: 32) {
            ZStack {
                Text("Profile")
                HStack {
                    Spacer()
                    Button {
                        userViewModel.showProfile = false
                    } label: {
                        Text("Done")
                    }
                }
            }
            .padding([.leading, .top, .trailing], 40)
            ProfileView()
        }
        .background(Color.white)
        .cornerRadius(30)
        .padding(.horizontal, 120)
        .shadow(
            color: Color(red: 0, green: 0, blue: 0, opacity: 0.50), radius: 10, x: 0, y: 0
        )
    }
}

#Preview {
    ProfilePopup()
        .environmentObject(UserViewModel())
        .modelContainer(SampleData.shared.modelContainer)
}
