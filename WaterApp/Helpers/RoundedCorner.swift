//
//  RoundedCorner.swift
//  WaterApp
//
//  Created by Aiur on 31.10.2020.
//

import SwiftUI

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View { // TODO: Check it later
//        clipShape(RoundedCorner(radius: radius, corners: corners))
        overlay(
            RoundedCorner(radius: radius, corners: corners)
        )
    }
}
