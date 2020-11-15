//
//  DayDrink.swift
//  WaterApp
//
//  Created by Aiur on 15.11.2020.
//

import Foundation

struct DailyLog: Identifiable {
    let id = UUID()
    let time: Date
    let capacity: Int // may be change it to
}
