//
//  DailyLogView.swift
//  WaterApp
//
//  Created by Aiur on 15.11.2020.
//

import SwiftUI

private struct LogItem: View {
    @State var day: DailyLog
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.white)
                .shadow(color: .gray, radius: 3, x: 0, y: 2)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 25)
//                        .stroke(Color.black, lineWidth: 1)
//                )
            HStack {
                Spacer()
                Text("\(day.capacity)ml")
                Spacer()
                Spacer()
                Text(convertTime(date: day.time))
                Spacer()
            }
        }
        .frame(height: 80)
        .padding([.leading, .trailing])
        
    }
    private func convertTime(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
}

struct DailyLogView: View {
    var dailyDrink: DailyDrink
    
    var body: some View {
        VStack(spacing: 16) {
            ForEach(dailyDrink.log, id: \.id) { (day: DailyLog) in
                LogItem(day: day)
            }
        }
    }
}

struct DailyLogView_Previews: PreviewProvider {
    static var previews: some View {
        DailyLogView(dailyDrink: DailyDrink(
                        date: Date(),
                        currentCapacityMl: 1600,
                        totalCapacityMl: 3000,
                        log: [
                            DailyLog(time: Date(), capacity: 250),
                            DailyLog(time: Date(), capacity: 250),
                            DailyLog(time: Date(), capacity: 250),
                            DailyLog(time: Date(), capacity: 250),
                            DailyLog(time: Date(), capacity: 250)
                        ])
        )
    }
}
