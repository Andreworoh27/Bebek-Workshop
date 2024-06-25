//
//  ProfileView.swift
//  BebekWorkshop
//
//  Created by Safira Humaira on 24/06/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView{
            VStack{
                ProfileHeaderView(
                    backgroundColor: Color.secondaryLightblue,
                    profileImage: Image(systemName: "person.crop.circle"),
                    name: "John Doe",
                    username: "@johndoe"
                )
                HStack {
                    Text("Set up your personal goal")
                        .font(Font.hostGrotesk(typography: .largeTitle))
                        .multilineTextAlignment(.leading)
                        .bold()
                        .padding(.leading, 40.0)
                    Spacer()
                }
            }
            
            DailyGoalHomeProgressComponent()
//            VStack{
//                Text("Checkout your reading statistics")
//                    .font(Font.hostGrotesk(typography: .largeTitle))
//                    .multilineTextAlignment(.leading)
//                    .bold()
//                    .padding(40.0)
//                Spacer()
//            }
            ReviewHistory()
                .padding()
            BadgesCollection()
        }.ignoresSafeArea()
    }
}
#Preview {
    ProfileView()
        .environmentObject(UserViewModel())
        .modelContainer(SampleData.shared.modelContainer)
}
