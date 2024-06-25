//
//  ReadingStatistics.swift
//  BebekWorkshop
//
//  Created by Safira Humaira on 25/06/24.
//

import SwiftUI
import Charts

struct ReadingStatistics: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @State var readingData: [Date : Int] = [:]
    
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
            Chart {
                ForEach(readingData.sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
                    LineMark(
                        x: .value("Day", key),
                        y: .value("Total", value)
                    )
                    .foregroundStyle(.mint)
                }
            }
            .chartXAxis {
                AxisMarks(values: .stride(by: .day)) { value in
                    AxisGridLine()
                    AxisValueLabel {
                        if let dateValue = value.as(Date.self) {
                            Text("\(Calendar.current.component(.day, from: dateValue))")
                        }
                    }
                }
            }
            .padding(.horizontal, 50.0)
            .frame(height: 200)
            .background()
            
        }
        .onAppear(perform: {
            readingData = ReadHistory.accumulateReadingTimeLastWeek(readHistories: userViewModel.userHistories)
            print(readingData)
        })
    }
}
#Preview {
    ReadingStatistics()
        .environmentObject(UserViewModel())
        .modelContainer(SampleData.shared.modelContainer)
}
