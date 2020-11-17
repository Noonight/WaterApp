//
//  CGFloat+Convert.swift
//  WaterApp
//
//  Created by Aiur on 17.11.2020.
//

import UIKit

extension CGFloat {
    static func percentFromInt(_ num: Int) -> CGFloat { // 0.0...1.0
        if num >= 100 {
            return 1.0
        } else {
            return CGFloat(num) / 100
        }
    }
}
