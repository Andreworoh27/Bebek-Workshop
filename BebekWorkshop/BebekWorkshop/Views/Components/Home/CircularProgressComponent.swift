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
                .stroke(Color.white, lineWidth: 15)
                .frame(width: 164)
            Circle()
                .trim(from: 0, to: progress)
                .stroke(Color.secondaryBlueberry,style: StrokeStyle(
                    lineWidth: 15,
                    lineCap: .round)
                )
                .frame(width: 164)
                .rotationEffect(.degrees(-90))
                .animation(.easeIn, value: progress)
        }
    }
}

#Preview {
    CircularProgressComponent(progress: 0.2)
}
