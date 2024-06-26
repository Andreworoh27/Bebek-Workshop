//
//  ProfileView.swift
//  BebekWorkshop
//
//  Created by Safira Humaira on 24/06/24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    var body: some View {
        VStack {
            ProfileHeaderView(
                backgroundColor: Color.secondaryLightblue,
                profileImage: Image("cat-profile"),
                name: userViewModel.currentLogUser?.name ?? "John Doe",
                username: userViewModel.currentLogUser?.username ?? "johndoe",
                streak: userViewModel.currentLogUser?.streak ?? 0
            )
            .padding(.bottom, 45)
            ReviewHistory()
                .padding(.bottom, 30)
            BadgesCollection()
        }.padding([.leading, .bottom], 40)
    }
}
#Preview {
    ProfileView()
        .environmentObject(UserViewModel())
        .modelContainer(SampleData.shared.modelContainer)
}
