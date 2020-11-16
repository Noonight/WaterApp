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
//                        .modifier(
//                            SizeTransition(height: calculateHeight())
//                        )
//                        .animation(animation)
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
//        .onAppear {
//            self.height = calculateHeight()
//        }
        
    }
}

struct SizeTransition: AnimatableModifier {
    var height: CGFloat

    var animatableData: CGFloat {
        get { height }
        set {
            height = newValue
        }
    }

    func body(content: Content) -> some View {
        print(height)
        return content.frame(
            height: height
        )
    }
}

struct DayPercentView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            DayPercentView(percent: 55)
        }
    }
}
