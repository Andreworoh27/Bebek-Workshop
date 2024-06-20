//
//  CircularProgressComponent.swift
//  BebekWorkshop
//
//  Created by Andrew Oroh on 20/06/24.
//

import SwiftUI

struct CircularProgressComponent: View {
    let progress : Double
    var body: some View {
        ZStack{
            Circle()
                .stroke(Color.tertiaryProgressOutline, lineWidth: 15)
                .frame(width: 129,height: 128.28)
            Circle()
                .trim(from: 0, to: progress)
                .stroke(Color.tertiaryProgresInnerCirlce,style: StrokeStyle(
                    lineWidth: 15,
                    lineCap: .round)
                )
                .frame(width: 122.48, height: 128.28)
                .rotationEffect(.degrees(-90))
                .animation(.easeIn, value: progress)
        }
    }
}

#Preview {
    CircularProgressComponent(progress: 0.2)
}
