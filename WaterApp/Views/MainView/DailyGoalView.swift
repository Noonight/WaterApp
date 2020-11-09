//
//  DailyGoalView.swift
//  WaterApp
//
//  Created by Aiur on 09.11.2020.
//

import SwiftUI

struct DailyGoalView: View {
    
    @State var goal: Int = 0
    
    private func dailyTotal(goal: Int) -> String {
        return "\(goal)ML"
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(dailyTotal(goal: goal))
                .foregroundColor(.white)
                .font(.system(.body, design: .rounded))
            Text("Daily goal")
                .foregroundColor(.white)
                .font(.system(.body, design: .rounded))
        }
    }
    
    
}

struct DailyGoalView_Previews: PreviewProvider {
    static var previews: some View {
        DailyGoalView()
    }
}
