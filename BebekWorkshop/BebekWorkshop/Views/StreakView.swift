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
                    ZStack{
                        Image("streak-top")
                            .resizable()
                            .frame(width: 337,height: 337)
                        Text("\(userViewModel.currentLogUser?.streak ?? 7)")
                            .font(Font.custom("HostGrotesk-Black", fixedSize: 72))
                            .offset(y: 95)
                    }
                    .padding(.bottom,42)
                    
                    HStack{
                        VStack(alignment: .leading){
                            Text("Keep your streak up!")
                                .font(Font.hostGrotesk(typography: .title1))
                            HStack(spacing: 0){
                                if (7 - (userViewModel.currentLogUser?.streak ?? 7) == 0){
                                    Text("You have reach your goal!")
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
                    .padding(.horizontal,72)
                    .padding(.bottom, 13)
                    
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
                                            Image("streak")
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
                    HStack{
                        Text("Your longest streak : ")
                            .font(Font.hostGrotesk(typography: .body))
                        Image("streak")
                            .resizable()
                            .frame(width: 27,height: 27)
                        Text("\(userViewModel.currentLogUser?.longestStreak ?? -1)")
                            .font(Font.hostGrotesk(typography: .body))
                            .padding(.trailing, 41)
                        
                        Text("Freeze streak left : ")
                            .font(Font.hostGrotesk(typography: .body))
                        
                        Image("streak-freeze")
                            .resizable()
                            .frame(width: 27,height: 27)
                        Text("\(userViewModel.currentLogUser?.streakFreeze ?? -1)")
                            .font(Font.hostGrotesk(typography: .body))
                        
                        Spacer()
                    }
                    .padding(.horizontal,72)
                    .padding(.bottom, 72)
                    
                    HStack{
                        challengeViewModel.isTakingChallenge == true ?
                        Text("Goodluck On Your Ongoing Challenge!")
                            .font(Font.hostGrotesk(typography: .title1))
                            .bold() :
                        Text("Feel like doing challenge?")
                            .font(Font.hostGrotesk(typography: .title1))
                            .bold()
                        
                        Spacer()
                    }
                    .padding(.leading,72)
                    
                    ZStack{
                        Rectangle()
                            .frame(width: 754, height: 211)
                            .cornerRadius(20)
                            .foregroundColor(Color.secondaryLightblueBackground)
                        HStack{
                            Image("challenge-cat")
                                .resizable()
                                .frame(width: 220, height: 220)
                                .padding(.leading,50)
                                .padding(.trailing,32/2)
                            
                            VStack(alignment: .leading){
                                if challengeViewModel.isTakingChallenge == true{
                                    
                                    Text("\(userViewModel.currentLogUser?.challenge?.challengeTitle ?? "Triple-week")")
                                        .font(Font.hostGrotesk(typography: .headline))
                                        .bold()
                                    
                                    Text("\(userViewModel.currentLogUser?.challenge?.challengeDescription ?? "keep streak for 3 weeks")")
                                        .font(Font.hostGrotesk(typography: .subhead))
                                        .padding(.bottom,10)
                                    
                                    Text("\(userViewModel.currentLogUser?.challenge?.challengeCurrentDateCounter ?? 12) / \(userViewModel.currentLogUser?.challenge?.challengeCurrentDateCounter ?? 21)")
                                        .padding(.bottom)
                                    
                                    // progress bar does not show progress
                                    ProgressView(value: Double((userViewModel.currentLogUser?.challenge?.challengeCurrentDateCounter ?? 12) / (userViewModel.currentLogUser?.challenge?.challengeDayDuration ?? 21))){
                                    }
                                    .scaleEffect(x: 1, y: 10, anchor: .center)
                                    .frame(width: 329)
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
                    }
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

#Preview {
    StreakView()
        .environmentObject(UserViewModel())
        .environmentObject(ChallengeViewModel())
        .modelContainer(SampleData.shared.modelContainer)
}
