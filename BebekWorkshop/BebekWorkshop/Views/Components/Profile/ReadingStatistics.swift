//
//  ReadingStatistics.swift
//  BebekWorkshop
//
//  Created by Safira Humaira on 25/06/24.
//

import SwiftUI
import Charts

struct ReadingStatistics: View {
    var dataCollection: ChartViewModel
    var body: some View {
        VStack{
            HStack {
                Text("Check out your reading statistics")
                    .font(Font.hostGrotesk(typography: .largeTitle))
                    .multilineTextAlignment(.leading)
                    .bold()
                    .padding(EdgeInsets(top: 20, leading: 40, bottom: 8, trailing: 0))
                Spacer()
            }
            
            HStack {
                Text("Last week - Minutes read")
                    .font(Font.custom("Host Grotesk", size: 17))
                    .foregroundColor(.black)
                .padding(EdgeInsets(top: 0, leading: 40, bottom: 8, trailing: 0))
                Spacer()
            }
            Chart(dataCollection.data){
                LineMark(
                    x: .value("Day", $0 .day),
                    y: .value("Total", $0 .minutes)
                )
                
                .symbol {
                    Circle()
                        .fill(Color.secondaryBlueberry)
                        .frame(width: 8)
                }
            }
            .padding(.horizontal, 50.0)
            .frame(height: 200)
            .background()
        }
    }
}
#Preview {
    ReadingStatistics(dataCollection: ChartViewModel())
}
