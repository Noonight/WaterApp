//
//  Text.swift
//  WaterApp
//
//  Created by Aiur on 05.11.2020.
//

import SwiftUI

struct BlackText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.black)
    }
}

extension Text {
    func black() -> some View {
        self.modifier(BlackText())
    }
}
