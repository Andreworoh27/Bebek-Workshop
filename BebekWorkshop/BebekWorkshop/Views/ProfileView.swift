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
                        .padding(EdgeInsets(top: 20, leading: 40, bottom: 0, trailing: 0))
                    Spacer()
                }
            }
            
            DailyGoalHomeProgressComponent()
            ReadingStatistics(dataCollection: ChartViewModel())
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