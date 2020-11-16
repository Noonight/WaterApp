//
//  DayPercentView.swift
//  WaterApp
//
//  Created by Aiur on 14.11.2020.
//

import SwiftUI

struct DayPercentView: View {
    
    @State var height: CGFloat = 0.0
    var fullHeight: CGFloat = 250
    var percent: Int = 0
    
    private func calculateHeight() -> CGFloat {
        let perc = CGFloat(percent)
        let onePerc = fullHeight / 100
        return onePerc * perc
    }
    
    let animation = Animation.linear.repeatForever().speed(0.5)
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                RoundedRectangle(cornerRadius: 5, style: .continuous)
                    .fill(Color.gray)
                    .frame(height: fullHeight)
                ZStack {
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .fill(Color.blue)
                        .frame(height: height)
                        .onAppear {
                            self.height = calculateHeight()
                        }
                    if percent >= 10 {
                        Text("\(percent)%")
                            .foregroundColor(.white)
                            .bold()
                    }
                }
            }
        }
    }
}

struct DayPercentView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            DayPercentView(percent: 55)
        }
    }
}
