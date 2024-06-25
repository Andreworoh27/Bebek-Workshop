//
//  ChallengeModalView.swift
//  BebekWorkshop
//
//  Created by Andrew Oroh on 25/06/24.
//

import SwiftUI

struct ChallengeModalView: View {
    @EnvironmentObject var challengeViewModel : ChallengeViewModel
    @EnvironmentObject var userViewModel : UserViewModel

    @Binding var showChallengeModal : Bool
    var body: some View {
        VStack{
            HStack{
                Button{
                    showChallengeModal = false
                }label: {
                    Text("Cancel")
                        .font(Font.hostGrotesk(typography: .body))
                }
                
                Spacer()
                
                Button{
                    showChallengeModal = false
                }label: {
                    Text("Done")
                        .font(Font.hostGrotesk(typography: .body))
                }
            }
            
            HStack{
                Text("Ready to take a challenge?")
                    .font(Font.hostGrotesk(typography: .title1))
                Spacer()
            }
            .padding(.top,22)
            HStack{
                Text("Pick one now and unlock new adventures")
                    .font(Font.hostGrotesk(typography: .body))
                Spacer()
            }
            .padding(.bottom,22)
                        
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 259))],spacing: 16, content: {
                    ForEach(challengesData, id: \.self){challenge in
                        Button{
                            
                            if(userViewModel.currentLogUser?.challenge == nil){
                                
                                
                                let userChallenge = Challenge(challengeTitle: challenge.challengeTitle, challengeDescription: challenge.challengeDescription, challengeDayDuration: challenge.challengeDayDuration)
                                
                                userChallenge.challengeStartDate = Date.now
                                
                                
                                if(userViewModel.currentLogUser?.setNewChallenge(challenge: userChallenge) == true){
                                    challengeViewModel.isTakingChallenge = true
                                }
                                
                            }
                            else if(userViewModel.currentLogUser?.challenge?.challengeTitle == challenge.challengeTitle){
                                
                                userViewModel.currentLogUser?.challenge = nil
                                challengeViewModel.isTakingChallenge = false
                            }
                        }label: {
                            if(userViewModel.currentLogUser?.challenge?.challengeTitle == challenge.challengeTitle){
                                ChallengeCardSelectedComponent(challenge: challenge)
                            }
                            else{
                                ChallengeCardComponent(challenge: challenge)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                })
               
            }
        }
        .padding(.horizontal, 31)
        .padding(.top, 22)
        .frame(width: 594, height: 772)
    }

}

#Preview {
    ChallengeModalView(showChallengeModal: .constant(true))
        .environmentObject(ChallengeViewModel())
        .environmentObject(UserViewModel())

}
