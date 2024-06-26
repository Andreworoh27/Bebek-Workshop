//
//  GoalReachedPopup.swift
//  BebekWorkshop
//
//  Created by Alfadli Maulana Siddik on 26/06/24.
//

import SwiftUI

struct GoalReachedPopup: View {
    @EnvironmentObject var userViewModel: UserViewModel
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
                            userViewModel.showAlert = false
                        }
                }
                Spacer()
            }
            VStack {
                Image("goal-achieved")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 570)
                    .padding(.leading, 54)
                Text("You have reached your goal!")
                    .font(Font.hostGrotesk(typography: .largeTitle))
                    .foregroundStyle(.white)
                Button {
                    userViewModel.showAlert = false
                } label: {
                    Text("Continue Reading")
                        .foregroundStyle(Color.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 22)
                }
                .background(Color.secondaryBlueberry)
                .cornerRadius(20)
                
            }
            Spacer()
        }
        .frame(maxHeight: .infinity)
        .padding(48)
        .background(Color.black.opacity(0.75))
    }
}

#Preview {
    GoalReachedPopup()
        .environmentObject(UserViewModel())
        .modelContainer(SampleData.shared.modelContainer)
}
