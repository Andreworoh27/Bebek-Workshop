//
//  StreakView.swift
//  BebekWorkshop
//
//  Created by Andrew Oroh on 24/06/24.
//

import SwiftUI

struct StreakView: View {
    @EnvironmentObject var userViewModel : UserViewModel
    @EnvironmentObject var challengeViewModel : ChallengeViewModel
    
    private var day:[String] = ["M","T","W","T","F","S","S"]
    @State private var showChallengeModal:Bool = false
    
    var body: some View {
        ZStack{
            ScrollView{
                VStack{
                    Text("Goal and streak")
                        .font(.system(size: 22))
                        .fontWeight(.semibold)
                        .padding(.bottom,42)
                    HStack {
                        Text("Close your daily goal ring!")
                            .font(Font.hostGrotesk(typography: .title1))
                            .multilineTextAlignment(.leading)
                            .bold()
                            .padding(.leading, 40.0)
                        Spacer()
                    }
                    DailyGoalHomeProgressComponent(selectedOption: userViewModel.userReadingGoal, showStats: true)
                        .padding(.horizontal, 40)
                        .padding(.bottom, 30)
                    HStack(){
                        VStack(alignment: .leading){
                            Text("Keep your streak up!")
                                .font(Font.hostGrotesk(typography: .title1))
                            HStack(spacing: 0){
                                if (7 - (userViewModel.currentLogUser?.streak ?? 7) == 0){
                                    Text("Extend your streak by reaching your reading goal today!")
                                        .font(Font.hostGrotesk(typography: .callout))
                                }
                                else{
                                    Text("Extend your streak to \(7 - (userViewModel.currentLogUser?.streak ?? 7)) by reaching your ")
                                        .font(Font.hostGrotesk(typography: .callout))
                                    Text("reading goal ")
                                        .font(Font.hostGrotesk(typography: .callout))
                                        .foregroundColor(Color.secondaryBlueberry)
                                    Text("today")
                                }
                            }
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 40)
                    
                    VStack (spacing:18){
                        HStack(spacing:18) {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(Color.secondaryLightblueBackground)
                                    .frame(width: 284, height: 142)
                                    .cornerRadius(20)
                                HStack {
                                    Image("fire-streak")
                                        .resizable()
                                        .frame(width: 75.0, height: 75.0)
                                    Text(String(userViewModel.currentLogUser?.streak ?? 0))
                                        .font(Font.custom("Host Grotesk", size: 72).weight(.black))
                                        .foregroundColor(.black)
                                }
                            }
                            ZStack{
                                Rectangle()
                                    .frame(width: 453, height: 142)
                                    .cornerRadius(20)
                                    .foregroundColor(Color.tertiaryMilkshake)
                                HStack{
                                    Image("challenge-cat")
                                        .resizable()
                                        .frame(width: 132.0, height: 132.0)
                                    //                                        .padding(.leading,25)
                                    
                                    
                                    VStack(alignment: .leading){
                                        if challengeViewModel.isTakingChallenge == false{
                                            
                                            Text("\(userViewModel.currentLogUser?.challenge?.challengeTitle ?? "Triple-week Trailblazer")")
                                                .font(Font.hostGrotesk(typography: .headline))
                                                .bold()
                                            
                                            Text("\(userViewModel.currentLogUser?.challenge?.challengeDescription ?? "Keeping streak for 3 weeks")")
                                                .font(Font.hostGrotesk(typography: .subhead))
                                                .padding(.bottom,10)
                                            
                                            ProgressView(value: (Float((userViewModel.currentLogUser?.challenge?.challengeCurrentDateCounter ?? 19)) / Float((userViewModel.currentLogUser?.challenge?.challengeDayDuration ?? 21)))){
                                            }
                                            .progressViewStyle(CustomProgressViewStyle(start: userViewModel.currentLogUser?.challenge?.challengeCurrentDateCounter ?? 19, end: (userViewModel.currentLogUser?.challenge?.challengeCurrentDateCounter ?? 21)))
                                            .frame(width: 280)
                                            
                                        }
                                        else{
                                            Text("Collect more badges")
                                                .font(Font.hostGrotesk(typography: .headline))
                                                .bold()
                                            Text("by keeping your streak alive")
                                                .font(Font.hostGrotesk(typography: .subhead))
                                            
                                            Button{
                                                // show challenge page pop up
                                                showChallengeModal = true
                                            }label: {
                                                ZStack
                                                {
                                                    Rectangle()
                                                        .frame(width: 153,height: 38)
                                                        .foregroundColor(Color.tertiaryBlush)
                                                        .cornerRadius(20)
                                                    
                                                    Text("Join Challenge")
                                                        .font(Font.hostGrotesk(typography: .callout))
                                                        .foregroundStyle(Color.white)
                                                    
                                                }
                                            }
                                        }
                                    }
                                    Spacer()
                                }
                                .frame(width: 453, height: 142)
                                
                            }
                        }
                        ZStack{
                            Rectangle()
                                .frame(width: 755, height: 178)
                                .cornerRadius(20)
                                .foregroundColor(Color.secondaryLightblueBackground)
                            
                            HStack(spacing: 17){
                                if((userViewModel.currentLogUser?.streak ?? 7) % 7 == 0 && (userViewModel.currentLogUser?.streak ?? 7) != 0){
                                    ForEach(0..<7, id: \.self){i in
                                        VStack(spacing: 15){
                                            Text("\(day[i])")
                                            if i == 6{
                                                Image("streak-price")
                                                    .resizable()
                                                    .frame(width: 76,height: 76)
                                            }
                                            else{
                                                Image("fire-streak")
                                                    .resizable()
                                                    .frame(width: 76,height: 76)
                                            }
                                        }
                                    }
                                }
                                else{
                                    ForEach(0..<7, id: \.self){i in
                                        VStack(spacing: 15){
                                            Text("\(day[i])")
                                            if i < (userViewModel.currentLogUser?.streak ?? 3) % 7  {
                                                Image("streak")
                                                    .resizable()
                                                    .frame(width: 76,height: 76)
                                            }
                                            else{
                                                if i == 6{
                                                    Image("streak-price-placeholder")
                                                        .resizable()
                                                        .frame(width: 76,height: 76)
                                                }else{
                                                    Image("streak-placeholder")
                                                        .resizable()
                                                        .frame(width: 76,height: 76)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    HStack{
                        Text("Your longest streak : ")
                            .font(Font.hostGrotesk(typography: .body))
                        Image("fire-streak")
                            .resizable()
                            .frame(width: 27,height: 27)
                        Text("\(userViewModel.currentLogUser?.longestStreak ?? -1)")
                            .font(Font.hostGrotesk(typography: .body))
                            .padding(.trailing, 41)
                        
                        Text("Freeze streak left : ")
                            .font(Font.hostGrotesk(typography: .body))
                        
                        Image("freeze")
                            .resizable()
                            .frame(width: 27,height: 27)
                        Text("\(userViewModel.currentLogUser?.streakFreeze ?? -1)")
                            .font(Font.hostGrotesk(typography: .body))
                        
                        Spacer()
                    }
                    .padding(.horizontal,56)
                    ReadingStatistics()
                        .padding(.top, 52)
                }
            }
            .blur(radius: showChallengeModal ? 10 : 0)
            .disabled(showChallengeModal)
            
            if showChallengeModal{
                ChallengeModalView(showChallengeModal: $showChallengeModal)
                    .background(Color.white)
                    .edgesIgnoringSafeArea(.all)
                    .cornerRadius(30)
                    .shadow(radius: 100)
            }
        }
    }
}

struct CustomProgressViewStyle: ProgressViewStyle {
    var start : Int
    var end : Int
    
    func makeBody(configuration: Configuration) -> some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: geometry.size.height / 2)
                    .fill(Color.white)
                
                let progressWidth = CGFloat(configuration.fractionCompleted ?? 0) * geometry.size.width
                
                ZStack {
                    RoundedRectangle(cornerRadius: geometry.size.height / 2)
                        .fill(Color.tertiaryMexican)
                        .frame(width: progressWidth)
                    
                    Text("\(start) / \(end)")
                        .frame(width: progressWidth, alignment: .center)
                        .foregroundColor(.white)
                }
            }
        }
        .frame(height: 30) // Adjust height here
    }
}

#Preview {
    StreakView()
        .environmentObject(UserViewModel())
        .environmentObject(ChallengeViewModel())
        .modelContainer(SampleData.shared.modelContainer)
}
