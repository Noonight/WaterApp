//
//  MonthlyReportView.swift
//  WaterApp
//
//  Created by Aiur on 12.11.2020.
//

import SwiftUI

struct MonthlyReportView: View {
    
    @State var dayChoosed: DailyDrink?
    @State var date: Date = Date()
    struct WeekDayItem: Identifiable {
        let id = UUID()
        let weekDay: String
        let percent: Int
        
        init(_ weekDay: String, _ percent: Int) {
            self.weekDay = weekDay
            self.percent = percent
        }
    }
    private var weekDays: [WeekDayItem] = []
    
    init() {
        weekDays.append(WeekDayItem("M", 53))
        weekDays.append(WeekDayItem("T", 22))
        weekDays.append(WeekDayItem("W", 76))
        weekDays.append(WeekDayItem("T", 6))
        weekDays.append(WeekDayItem("F", 92))
        weekDays.append(WeekDayItem("S", 11))
        weekDays.append(WeekDayItem("S", 31))
    }
    
    private func datePeriod(date: Date) -> String {
        let previousThree = Calendar.current.date(byAdding: DateComponents(day: -3), to: date)
        let nextThree = Calendar.current.date(byAdding: DateComponents(day: 3), to: date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd"
        return "\(dateFormatter.string(from: previousThree!)) - \(dateFormatter.string(from: nextThree!))"
    }
    
    var body: some View {
        NavigationView {
            
            VStack(alignment: .leading, spacing: 8) {
                DatePicker("Choose date", selection: $date, displayedComponents: DatePicker<Text>.Components.date)
                    .padding([.leading, .trailing])
                    
                Text(datePeriod(date: date))
                    .font(Font.system(size: 16))
                    .foregroundColor(.gray)
                    .padding([.leading, .trailing])
                HStack(alignment: .center) {
                    Text("Average:")
                    Text("2450ML")
                }
                .padding([.leading, .trailing])
                Rectangle()
                    .fill(Color.black)
                    .frame(height: 0.5)
                HStack(alignment: .center, spacing: 10) {
                    ForEach(weekDays) { (weekDay: WeekDayItem) in
                        VStack {
                            Text(weekDay.weekDay)
                                .bold()
                            DayPercentView(percent: weekDay.percent)
                        }
                    }
                }
                .padding([.leading, .trailing])
//                .background(Color.red)
                if let dayChoosed = dayChoosed {
                    DailyLogView(dailyDrink: dayChoosed)
                } else {
                    HStack(alignment: .center) {
                        Spacer()
                        VStack {
                            Spacer()
                            Text("Tap on week day to see log")
                                .font(.title2)
                            Spacer()
                        }
                        Spacer()
                    }
                }
                Spacer()
            }
            .navigationTitle("Monthly Report")
        }
    }
}

struct MonthlyReportView_Previews: PreviewProvider {
    static var previews: some View {
        MonthlyReportView()
    }
}
