//
//  DailyGoalHomeProgressComponent.swift
//  BebekWorkshop
//
//  Created by Andrew Oroh on 20/06/24.
//

import SwiftUI
import SwiftData

struct DailyGoalHomeProgressComponent: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @Query private var readHistories: [ReadHistory]
    
    @State var selectedOption: Int
    
    var totalReadingMinutesToday: Int {
        ReadHistory.accumulateReadingMinutesToday(readHistories: userViewModel.userHistories)
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .cornerRadius(30)
                .foregroundColor(Color.secondaryLightblueBackground)
            HStack {
                ZStack (alignment: .bottom) {
                    Image("cat-goal")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 130)
                    CircularProgressComponent(progress: Double(totalReadingMinutesToday)/Double(userViewModel.currentLogUser?.readingGoal ?? 1))
                }
                .padding(.trailing, 48)
                
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        VStack(alignment: .leading){
                            Text("You can do it!")
                                .font(Font.hostGrotesk(typography: .title1))
                                .fontWeight(.semibold)
                            Text("Just a few more minutes to complete your ring")
                        }
                        Spacer()
                    }
                    
                    HStack(spacing: 22) {
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Today’s Time")
                            Text("\(totalReadingMinutesToday) minutes")
                                .font(Font.hostGrotesk(typography: .title1))
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        }
                        Divider()
                            .frame(height: 48)
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Your Goal")
                            HStack {
                                Text("\(userViewModel.userReadingGoal) minutes")
                                    .font(Font.hostGrotesk(typography: .title1))
                                    .fontWeight(.bold)
                                
                                ZStack {
                                    Image(systemName: "square.and.pencil")
                                        .foregroundColor(Color.secondaryBlueberry)
                                    Picker("setGoal",
                                        selection: $selectedOption
                                    ) {
                                        
                                        ForEach(0..<60, id: \.self) { i in
                                            Text(String(i)).tag(i)
                                        }
                                    }
                                    .opacity(0.011)
                                    .onChange(of: selectedOption) { oldValue, newValue in
                                        if newValue > oldValue {
                                            userViewModel.alertHasShown = false
                                            userViewModel.currentLogUser?.streak -= 1
                                        }
                                        userViewModel.currentLogUser?.readingGoal = newValue
                                    }
                                }
                            }
                        }
                        Spacer()
                    }
                    
                }
                
                
                Spacer()
            }
            .padding(48)
        }
        .padding(.horizontal, 40)
    }
}

#Preview {
    DailyGoalHomeProgressComponent(selectedOption: User.sampleData[0].readingGoal)
        .environmentObject(UserViewModel())
        .modelContainer(SampleData.shared.modelContainer)
}
