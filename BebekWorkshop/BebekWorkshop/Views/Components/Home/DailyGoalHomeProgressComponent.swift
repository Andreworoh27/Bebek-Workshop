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
                .foregroundColor(Color(red: 1, green: 0.81, blue: 0.84))
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
                                Text("3 minutes left")
                                    .font(Font.hostGrotesk(typography: .title1))
                                    .fontWeight(.bold)
                                Text("to complete your ring!")
                                    .font(Font.hostGrotesk(typography: .title3))
                                    .fontWeight(.light)
                            }
                            ZStack{
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 100, height: 50.0)
                                    .background(.white)
                                    .cornerRadius(15)
                                    .opacity(0.35)
                                HStack {
                                    Image("fire-streak")
                                    Text("36")
                                        .font(Font.custom("Host Grotesk", size: 28).weight(.bold))
                                        .foregroundColor(Color.black)
                                }
                            }.padding(EdgeInsets(top: 0, leading: 110, bottom: 40, trailing: 0))
                    }
                    HStack(spacing: 22) {
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Today’s Time")
                                .font(Font.hostGrotesk(typography: .title3))
                            Text("\(totalReadingMinutesToday) minutes")
                                .font(Font.hostGrotesk(typography: .title1))
                                .fontWeight(.bold)
                        }
                        Divider()
                            .frame(height: 48)
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Your Goal")
                                .font(Font.hostGrotesk(typography: .title3))
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
//                    HStack{
//                        Image(systemName: "clock")
//                            .resizable()
//                            .foregroundColor(.tertiaryMexican)
//                            .frame(width: 30.0, height: 30.0)
//                        
//                        VStack {
//                            Text("12h 25m")
//                                .font(.title2)
//                                .fontWeight(.bold)
//                                .foregroundColor(Color.black)
//                            Text("Total Hours")
//                                .font(.footnote)
//                                .fontWeight(.regular)
//                        }
//                        Divider()
//                            .padding(.horizontal,8)
//                            .frame(height: 50)
//                        Image(systemName: "book")
//                            .resizable()
//                            .foregroundColor(.tertiaryMexican)
//                            .frame(width: 30, height: 26)
//                        
//                        VStack(alignment: .leading){
//                            Text("1")
//                                .font(.title2)
//                                .fontWeight(.bold)
//                                .foregroundColor(Color.black)
//                            Text("Total Books")
//                                .font(.footnote)
//                                .fontWeight(.regular)
//                        }
//                        Divider()
//                            .padding(.horizontal, 8)
//                            .frame(height: 50)
//                        Image(systemName: "book.pages")
//                            .resizable()
//                            .foregroundColor(.tertiaryMexican)
//                            .frame(width: 26, height: 30)
//                        VStack(alignment: .leading){
//                            Text("67")
//                                .font(.title2)
//                                .fontWeight(.bold)
//                                .foregroundColor(Color.black)
//                            Text("Total Pages")
//                                .font(.footnote)
//                                .fontWeight(.regular)
//                        }
//                    }
                    .padding([.top, .bottom, .trailing], 8.0)
                    
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
