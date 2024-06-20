//
//  DailyGoalHomeProgressComponent.swift
//  BebekWorkshop
//
//  Created by Andrew Oroh on 20/06/24.
//

import SwiftUI

struct DailyGoalHomeProgressComponent: View {
    var body: some View {
        ZStack{
            Rectangle()
                .cornerRadius(30)
                .foregroundColor(Color.tertiaryVarMilkshake)
            HStack{
                CircularProgressComponent(progress: 0.65)
                    .padding(.trailing, 48)
                    .padding(.leading, 64)
                                
                VStack(alignment: .leading){
                    Text("A little more!")
                        .font(Font.hostGrotesk(typography: .title1))
                    HStack(spacing: 0){
                        Text("Read for ")
                            .font(Font.hostGrotesk(typography: .body))
                        Text("\(10) more minutes ")
                            .font(Font.hostGrotesk(typography: .headline))
                        Text("to reach your goal.")
                            .font(Font.hostGrotesk(typography: .body))
                    }
                }
                
                Spacer()
            }
        }
        .frame(width: 754, height: 208)
    }
}

#Preview {
    DailyGoalHomeProgressComponent()
}
