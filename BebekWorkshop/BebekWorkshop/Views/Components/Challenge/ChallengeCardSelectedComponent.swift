//
//  ChallengeCardSelectedComponent.swift
//  BebekWorkshop
//
//  Created by Andrew Oroh on 25/06/24.
//

import SwiftUI

struct ChallengeCardSelectedComponent: View {
    var challenge : Challenge
    
    var body: some View {
        ZStack{
            Image("challenge-background")
                .resizable()
                .frame(width:259 ,height:155 )
                .cornerRadius(15)
            Rectangle()
                .frame(width:259 ,height:155 )
                .cornerRadius(15)
                .foregroundColor(Color.secondaryBlueChallengeSelected)
            VStack(){
                Spacer()
                HStack{
                    Text("\(challenge.challengeTitle)")
                        .font(Font.hostGrotesk(typography: .headline))
                        .foregroundStyle(Color.white)
                    Spacer()
                }
                .padding(.bottom, 5)
                HStack {
                    Text("\(challenge.challengeDescription)")
                        .font(Font.hostGrotesk(typography: .caption1))
                        .foregroundStyle(Color.white)
                    Spacer()
                }
                
            }
            .padding(.leading, 25)
            .padding(.bottom, 16)
        }
        .frame(width: 259, height: 155)
    }
}

#Preview {
    ChallengeCardSelectedComponent(challenge: challengesData[0])
}
