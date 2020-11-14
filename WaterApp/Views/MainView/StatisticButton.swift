//
//  StatisticButton.swift
//  WaterApp
//
//  Created by Aiur on 09.11.2020.
//

import SwiftUI

enum DayOfWeek: String {
    case monday = "Monday"
    case tuesday = "Tuesday"
    case wednesday = "Wednesday"
    case thursday = "Thursday"
    case friday = "Friday"
    case saturday = "Saturday"
    case sunday = "Sunday"
    
    static func getWeekday(of num: Int) -> String {
        switch num {
        case 0: return self.monday.rawValue
        case 1: return self.tuesday.rawValue
        case 2: return self.wednesday.rawValue
        case 3: return self.thursday.rawValue
        case 4: return self.friday.rawValue
        case 5: return self.saturday.rawValue
        case 6: return self.sunday.rawValue
        default:
            return "none"
        }
    }
}

struct StatisticButton: View {
    
//    @State var dayOfWeek: DayOfWeek = .monday
    
    let tap: (() -> ())?
    
    init(tap: (() -> ())? = nil) {
        self.tap = tap
    }
    
    private func getDayOfWeek() -> String {
        let date = Date()
        let calendar = Calendar.current
        return DayOfWeek.getWeekday(of: calendar.component(.weekday, from: date) - 2)
    }
    
    var body: some View {
        Button {
            tap?()
        } label: {
            HStack(alignment: .center) {
                Image(systemName:"chart.bar.xaxis")
                    .resizable()
                    .frame(width: iconSize, height: iconSize)
                    .foregroundColor(.blue)
                Text(getDayOfWeek()).foregroundColor(.blue)
            }
        }
    }
}

struct StatisticButton_Previews: PreviewProvider {
    static var previews: some View {
        StatisticButton()
    }
}
