//
//  CircularProgressComponent.swift
//  BebekWorkshop
//
//  Created by Andrew Oroh on 20/06/24.
//

import SwiftUI

struct CircularProgressComponent: View {
    let progress : Double
    let lineWidth: Int
    var body: some View {
        ZStack{
            Circle()
                .stroke(Color.white, lineWidth: CGFloat(lineWidth))
            Circle()
                .trim(from: 0, to: progress)
                .stroke(Color.secondaryBlueberry,style: StrokeStyle(
                    lineWidth: 20,
                    lineCap: .round)
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeIn, value: progress)
        }
    }
}

#Preview {
    CircularProgressComponent(progress: 0.2, lineWidth: 15)
}
