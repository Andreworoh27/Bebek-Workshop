//
//  DailyGoalHomeProgressComponent.swift
//  BebekWorkshop
//
//  Created by Andrew Oroh on 20/06/24.
//

import SwiftUI

struct DailyGoalHomeProgressComponent: View {
    var body: some View {
        ZStack {
            Rectangle()
                .cornerRadius(30)
                .foregroundColor(Color.secondaryLightblueBackground)
            HStack {
                ZStack (alignment: .bottom) {
                    Image("cat-placeholder")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 140)
                    CircularProgressComponent(progress: 0.65)
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
                        VStack(alignment: .leading) {
                            Text("Today’s Time")
                            Text("7 minutes")
                                .font(Font.hostGrotesk(typography: .title1))
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        }
                        Divider()
                            .frame(height: 48)
                        VStack(alignment: .leading) {
                            Text("Your Goal")
                            Text("10 minutes")
                                .font(Font.hostGrotesk(typography: .title1))
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        }
                        Spacer()
                    }
                    
                    Button(action: {}, label: {
                        Text("Edit Goal")
                    })
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
                    .foregroundColor(.white)
                    .background(Color.tertiaryBlush)
                    .cornerRadius(25)
                    
                }
                
                
                Spacer()
            }
            .padding(48)
        }
        .padding(.horizontal, 40)
    }
}

#Preview {
    DailyGoalHomeProgressComponent()
}
