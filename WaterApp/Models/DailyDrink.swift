//
//  DailyDrink.swift
//  WaterApp
//
//  Created by Aiur on 15.11.2020.
//

import Foundation

struct DailyDrink: Identifiable {
    let id = UUID()
    let date: Date
    let currentCapacityMl: Int
    let totalCapacityMl: Int
    var log: [DailyLog]
}
