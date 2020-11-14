//
//  StateWaveView.swift
//  WaterApp
//
//  Created by Aiur on 07.11.2020.
//

import SwiftUI

struct StateWaveView: View {
    
    var curCap = 1900
    var totalCap = 3000
    
    private func getCapacity() -> String {
//        return "\(curCap) / \(totalCap)"
        return "\(curCap) / \(totalCap)"
    }
    
    private func getPercent() -> String {
        return "\(((totalCap / 100) * curCap) / 1000) %"
    }
    
    @State private var currentCapacity: String = "56 %"
    @State private var totalCapacity: String = "1.9 / 3"
    
    var body: some View {
        VStack(alignment: .center, spacing: 150) {
            Text(getCapacity())
                .foregroundColor(.blue)
                .bold()
                .font(.title)
            Text(getPercent())
                .foregroundColor(.white)
                .bold()
                .font(.title)
        }
    }
}

struct StateWaveView_Previews: PreviewProvider {
    static var previews: some View {
        StateWaveView()
    }
}
