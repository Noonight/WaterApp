//
//  DayPercentView.swift
//  WaterApp
//
//  Created by Aiur on 14.11.2020.
//

import SwiftUI

struct DayPercentView: View {
    
//    @State var width: CGFloat = 48.0 // 40 minimum for good text matching
    @State var height: CGFloat = 0.0
    var fullHeight: CGFloat = 250
    var percent: Int = 0
    
    private func calculateHeight() -> CGFloat {
        let perc = CGFloat(percent)
        let onePerc = fullHeight / 100
        return onePerc * perc
    }
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                RoundedRectangle(cornerRadius: 5, style: .continuous)
                    .fill(Color.gray)
                    .frame(/*width: width, */height: fullHeight) // width calculated in super view (HStack)
                ZStack {
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .fill(Color.blue)
                        .frame(/*width: width, */height: height)
                    if percent >= 10 {
                        Text("\(percent)%")
                            .foregroundColor(.white)
                            .bold()
                    }
                }
            }
        }
        .onAppear {
            self.height = calculateHeight()
        }
        
    }
}

struct DayPercentView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            DayPercentView(percent: 100)
        }
    }
}
