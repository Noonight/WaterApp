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
}

struct StatisticButton: View {
    
    @State var dayOfWeek: DayOfWeek
    
    var body: some View {
        Button {
            
        } label: {
            HStack(alignment: .center) {
                Image(systemName:"chart.bar.xaxis")
                    .resizable()
                    .frame(width: iconSize, height: iconSize)
                    .foregroundColor(.blue)
                Text(dayOfWeek.rawValue).foregroundColor(.blue)
            }
        }
    }
}

struct StatisticButton_Previews: PreviewProvider {
    static var previews: some View {
        StatisticButton(dayOfWeek: .thursday)
    }
}
